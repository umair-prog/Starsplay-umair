//
//  NetworkConstants.swift
//  SlickCall
//
//  Created by Slickcall on 17/09/2021.
//

import UIKit
import Foundation
import Alamofire

struct NetworkConstants {
    
    //The API's base URL
    static let baseUrl = "https://api.themoviedb.org/3/"
    static let apiKey = "?api_key=ecef14eac236a5d4ec6ac3a4a4761e8f"
    static let imageBaseUrl = "https://image.tmdb.org/t/p/w500/"





    
    //The parameters (Queries) that we're gonna use
    struct EndPoints {
        static let series_id = "tv/62852"
        static let season_number = "/season/"
        static let episode_number = "/episode/"
        
    }
}
