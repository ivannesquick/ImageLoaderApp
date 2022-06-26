//
//  UploadImageView.swift
//  ImageLoaderApp
//
//  Created by Иван Нескин on 23.06.2022.
//

import UIKit

class UploadImageView: UIImageView {
    private let imageCache = NSCache<NSString, UIImage>()
    
    func loadRemoteImageFrom(urlString: String) {
        if let cachedImage = checkImageInCache(cacheKey: urlString) {
            self.image = cachedImage
        } else {
            NetworkManager.shared.loadImage(urlString: urlString) { [weak self] image in
                guard let self = self else { return }
                if let image = image {
                    self.saveImageInCache(image: image, cacheKey: urlString)
                    DispatchQueue.main.async {
                        self.image = image
                    }
                } else {
                    print("Error: Failed type casting Data in UIImage ")
                    self.backgroundColor = .systemGray
                }
            }
        }
    }
    
    private func checkImageInCache(cacheKey: String) -> UIImage?  {
        if let cachedImage = self.imageCache.object(forKey: cacheKey as NSString) {
            return cachedImage
        } else {
            return nil
        }
    }
    
    private func saveImageInCache(image: UIImage, cacheKey: String) {
        imageCache.setObject(image, forKey: cacheKey as NSString)
    }
}
