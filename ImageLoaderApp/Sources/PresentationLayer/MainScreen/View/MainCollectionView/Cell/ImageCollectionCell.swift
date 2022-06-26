//
//  ImageCollectionCell.swift
//  ImageLoaderApp
//
//  Created by Иван Нескин on 22.06.2022.
//

import UIKit

class ImageCollectionCell: UICollectionViewCell {
    static let cellIdenttifire = "ImageCollectionCell"
    private var uploadImageView = UploadImageView()
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        setupContent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupContent() {
        addSubview(uploadImageView)
        uploadImageView.translatesAutoresizingMaskIntoConstraints = false
        uploadImageView.backgroundColor = .white
        uploadImageView.contentMode = .scaleAspectFill
        uploadImageView.clipsToBounds = true
        
        uploadImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        uploadImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        uploadImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        uploadImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        }
}

extension ImageCollectionCell {
    func configureImageCell(currentImage: CollectionImage) {
        uploadImageView.loadRemoteImageFrom(urlString: currentImage.imageURL)
    }
}
