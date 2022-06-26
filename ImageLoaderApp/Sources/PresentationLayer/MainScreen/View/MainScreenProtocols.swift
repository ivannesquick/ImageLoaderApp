//
//  MainScreenProtocols.swift
//  ImageLoaderApp
//
//  Created by Иван Нескин on 22.06.2022.
//

import Foundation

protocol MainViewOutput {
    func getImages()
}

protocol MainViewInput: AnyObject {
    func reloadCollection(images: [CollectionImage])
}
