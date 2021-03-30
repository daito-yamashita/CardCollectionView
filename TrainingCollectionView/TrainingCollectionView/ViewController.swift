//
//  ViewController.swift
//  TrainingCollectionView
//
//  Created by daito yamashita on 2021/03/29.
//

import UIKit

class ViewController: UIViewController {

    enum Section {
        case main
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Int>!
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureDataSource()
    }

    // 基本の流れは、
    // item
    // group
    // section
    // layout
    func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // itemの間に空白を入れる
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalHeight(1.0))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        // 縦横にスクロールするCollectionViewを作成
        section.orthogonalScrollingBehavior = .groupPaging
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .black
        view.addSubview(collectionView)
    }
    
    func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Int> { (cell, indexPath, item) in
            var contentConfiguration = cell.defaultContentConfiguration()
            
            contentConfiguration.text = "\(item)"
            contentConfiguration.textProperties.color = .lightGray
            
            cell.contentConfiguration = contentConfiguration
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Int) -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapshot.appendSections([.main])
        snapshot.appendItems(Array(0..<20))
        dataSource.apply(snapshot, animatingDifferences: false)
        
    }
}

