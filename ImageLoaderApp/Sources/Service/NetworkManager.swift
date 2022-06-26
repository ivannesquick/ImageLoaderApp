//
//  NetworkManager.swift
//  ImageLoaderApp
//
//  Created by Иван Нескин on 26.06.2022.
//

import Foundation
import UIKit

class NetworkManager {
    static let shared: NetworkManager = {
       return NetworkManager()
    }()
    
    func loadImage(urlString: String, completion: @escaping (UIImage?) -> ()) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let imageFromData = UIImage(data: data)
                completion(imageFromData)
            }
            if error != nil {
                completion(nil)
            }
        }.resume()
    }
}
