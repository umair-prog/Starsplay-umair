//
//  AFManager.swift
//  SlickCall
//

//  Created by umair on 5/29/23.


import Foundation
import Alamofire



class APIManager {
    
    
    static func request(endPoint: String,
                        success: @escaping (_ response: Data?) -> Void,
                        failure: @escaping (_ error: Error?) -> Void) {
        
        let urlString = "\(NetworkConstants.baseUrl)\(endPoint)\(NetworkConstants.apiKey)"
        
        AF.request(urlString).response { response in
            switch response.result {
            case .success(let data):
                success(data)
            case .failure(let error):
                failure(error)
            }
        }
    }
}
