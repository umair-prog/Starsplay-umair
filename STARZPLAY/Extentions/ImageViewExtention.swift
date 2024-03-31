//
//  ImageViewExtention.swift
//  STARZPLAY
//
//  Created by umair on 31/03/2024.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(from url: URL, placeholder: UIImage? = nil) {
        self.image = placeholder
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error loading image: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Invalid response")
                return
            }
            
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                }
            } else {
                print("Invalid image data")
            }
        }.resume()
    }
}
