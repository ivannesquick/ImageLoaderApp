//
//  MainCollectionView.swift
//  ImageLoaderApp
//
//  Created by Иван Нескин on 22.06.2022.
//

import UIKit

class MainCollectionView: UICollectionView {
    private var refreshController: UIRefreshControl?
    var images: [CollectionImage] = []
    weak var mainCollectionDelegate: MainCollectionDelegate?
    init() {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: viewLayout)
        configureCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCollectionView() {
        self.delegate = self
        self.dataSource = self
        self.register(ImageCollectionCell.self, forCellWithReuseIdentifier: ImageCollectionCell.cellIdenttifire)
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(nil, action: #selector(refreshImageList), for: .valueChanged)
    }
    
    func reload() {
        self.reloadData()
        self.refreshControl?.endRefreshing()
    }
    
    @objc func refreshImageList() {
        mainCollectionDelegate?.refreshImageList()
    }
}

extension MainCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let imageCell = self.dequeueReusableCell(withReuseIdentifier: ImageCollectionCell.cellIdenttifire, for: indexPath) as? ImageCollectionCell else { return UICollectionViewCell() }
        imageCell.configureImageCell(currentImage: images[indexPath.row])
        return imageCell
    }
}

extension MainCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        UIView.animate(withDuration: 1) {
            guard let cell = collectionView.cellForItem(at: indexPath) else {
                return
            }
            cell.center = CGPoint(x: cell.center.x + cell.frame.width + 10,
                                  y: cell.center.y)
            cell.alpha = 0
        } completion: { [weak self] success in
            guard let self = self else {
                return
            }
            if success {
                self.images.remove(at: indexPath.row)
                collectionView.deleteItems(at: [indexPath])
            }
        }
    }
}

extension MainCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: self.frame.size.width, height: self.frame.size.width)
    }
}
