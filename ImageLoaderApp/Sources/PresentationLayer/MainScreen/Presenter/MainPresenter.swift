//
//  MainPresenter.swift
//  ImageLoaderApp
//
//  Created by Иван Нескин on 22.06.2022.
//

import Foundation

final class MainPresenter {
    weak var view: MainViewInput!
    
    init(view: MainViewInput) {
        self.view = view
    }
}


extension MainPresenter: MainViewOutput {
    func getImages() {
        let images = ImageStorage.shared.getFullURLList()
        view.reloadCollection(images: images)
    }
}
