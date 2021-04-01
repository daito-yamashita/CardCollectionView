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

    let cardsController = CardController()
    var dataSource: UICollectionViewDiffableDataSource<Section, CardController.Card>!
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureDataSource()
    }

    // 基本の流れは、
    // item -> group -> section -> layout
    func createLayout() -> UICollectionViewLayout {
        // itemの設定
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        // itemの間に空白を入れる
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        // groupの設定
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalHeight(1.0))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        // 縦横にスクロールするCollectionViewを作成
        section.orthogonalScrollingBehavior = .groupPaging
        
        // layoutを作成
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    func configureHierarchy() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
    }
    
    func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<CardCell, CardController.Card> { (cell, indexPath, card) in
            cell.nameLabel.text = card.name
            cell.costLabel.text = card.cost
            cell.effectLabel.text = card.effect
            cell.attackLabel.text = card.attack
            cell.defenseLabel.text = card.defense
            cell.backgroundColor = .systemBackground
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, CardController.Card>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, card: CardController.Card) -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: card)
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, CardController.Card>()
        snapshot.appendSections([.main])
        snapshot.appendItems(cardsController.collections)
        dataSource.apply(snapshot, animatingDifferences: false)
    
    }
}

