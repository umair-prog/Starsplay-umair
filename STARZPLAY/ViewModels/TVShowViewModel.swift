

import Foundation
import UIKit

class  TVShowViewModel {
    
    var tvShowModel: TVShowDetailsModel?
    
    var numberOfSeasons: String  {
        guard let numberofSeasons = tvShowModel?.number_of_seasons else {
            print("number of seasons ot found")
            return "0"
        }
        return String(numberofSeasons)
    }
    
    var tvShowOverView: String {
        guard let overview = tvShowModel?.overview else {
            return "0"
        }
        return overview
    }
    
    var tvShowYear: String {
        guard let date = tvShowModel?.first_air_date else {
            return "0"
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        if let airDate = dateFormatter.date(from: date) {
            let calendar = Calendar.current
            let year = calendar.component(.year, from: airDate)
            return "\(year)"
        } else {
            return "0"
        }
    }
    
    var tvShowName: String {
        guard let name = tvShowModel?.name else {
            return "0"
        }
        return name
    }
    var tvShowPosterURL: URL? {
        guard let posterPath = tvShowModel?.poster_path else {
            return nil
        }
        let baseURL = NetworkConstants.imageBaseUrl
        return URL(string: baseURL + posterPath)
    }

    


    func requestTVShowDetails(endPoint: String, success: @escaping (TVShowDetailsModel) -> Void, failure: @escaping (Error?) -> Void) {
        APIManager.request(endPoint: endPoint) { responseData in
            if let data = responseData {
                // Handle successful response data
                do {
                    let decoder = JSONDecoder()
                    let tvShowModel = try decoder.decode(TVShowDetailsModel.self, from: data)
                    success(tvShowModel)
                } catch {
                    failure(error)
                }
            } else {
                // Handle nil or empty response data
                failure(nil)
            }
        } failure: { error in
            // Handle error
            failure(error)
        }
    }
}


