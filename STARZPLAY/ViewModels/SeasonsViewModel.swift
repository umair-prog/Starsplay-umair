//
//  SeasonsViewModel.swift
//  STARZPLAY
//
//  Created by umair on 31/03/2024.
//

import Foundation

class SeasonsViewModel {
    
    let seasons: [Seasons] // 5
    var seasonsDetail: [SeasonsDetail] = []
    
    func setEmptySeasonDetails(){
        seasonsDetail = Array(repeating: SeasonsDetail(), count: seasons.count)
    }
    
    func saveSeasonDetail(for season: Seasons, seasonDetail: SeasonsDetail) {
        guard let season_number = season.season_number else {
            return
        }
        let index = season_number
        seasonsDetail[index] = seasonDetail
    }
    
    func getPreLoadedSeasonDetail(for season: Seasons) -> SeasonsDetail? {
        guard let season_number = season.season_number,
              seasonsDetail[season_number].id != nil else {
            return nil
        }
        let index = season_number
        return seasonsDetail[index]
    }
    
    func loadAllSeasons(){
        let dpG = DispatchGroup()
        
        
        seasons.forEach { season in
            dpG.enter()
            self.requestSeasonDetails(season: season) { season in
                dpG.leave()
            } failure: { _ in
                dpG.leave()
            }
        }
    }
    
    
    
    init(seasons: [Seasons]) {
        self.seasons = seasons
        setEmptySeasonDetails()
        loadAllSeasons()
    }
    
    func requestSeasonDetails(season: Seasons, success: @escaping (SeasonsDetail) -> Void, failure: @escaping (String) -> Void) {
        guard let seasonNumber = season.season_number else {
            failure("no season number found")
            return
        }
//        seasonNumber += 1
//        if let preloadedSeasondetail = getPreLoadedSeasonDetail(for: season) {
//            success(preloadedSeasondetail)
//            return
//        }
        
        let seasonNumberStr = String(seasonNumber)
        
        let endPoint = "\(NetworkConstants.EndPoints.series_id)\(NetworkConstants.EndPoints.season_number)/\(seasonNumberStr)"
        
        APIManager.request(endPoint: endPoint) { responseData in
            if let data = responseData {
                // Handle successful response data
                do {
                    let decoder = JSONDecoder()
                    let seasonDetail = try decoder.decode(SeasonsDetail.self, from: data)
                    success(seasonDetail)
                    self.saveSeasonDetail(for: season, seasonDetail: seasonDetail)
                    
                    
                } catch {
                    failure("invalid season data")
                }
                return
            }
            
            failure("error loading detail")
            
        } failure: { error in
            // Handle error
            failure(error?.localizedDescription ?? "unknonw error")
        }
    }
    
}
