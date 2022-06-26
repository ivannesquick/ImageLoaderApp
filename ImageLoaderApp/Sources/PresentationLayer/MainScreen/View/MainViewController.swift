//
//  MainViewController.swift
//  ImageLoaderApp
//
//  Created by Иван Нескин on 22.06.2022.
//

import UIKit

class MainViewController: UIViewController {
    private lazy var ouput: MainViewOutput = {
        let mainPresenter = MainPresenter(view: self)
        return mainPresenter
    }()
    private var mainCollectionView = MainCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupMainCollectionView()
        ouput.getImages()
        title = "Gallery"
        navigationController?.navigationBar.isTranslucent = false
    }
    
    private func setupMainCollectionView() {
        mainCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainCollectionView)
        mainCollectionView.backgroundColor = .white
        mainCollectionView.mainCollectionDelegate = self
        
        mainCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        mainCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        mainCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension MainViewController: MainViewInput {
    func reloadCollection(images: [CollectionImage]) {
        mainCollectionView.images = images
        mainCollectionView.reload()
    }
}

extension MainViewController: MainCollectionDelegate {
    func refreshImageList() {
        ouput.getImages()
    }
}
