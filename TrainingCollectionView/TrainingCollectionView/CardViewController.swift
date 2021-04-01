//
//  CardViewController.swift
//  TrainingCollectionView
//
//  Created by daito yamashita on 2021/03/29.
//

import UIKit

class CardViewController: UIViewController {

    enum Section {
        case main
    }

    let cardsController = CardController()
    var dataSource: UICollectionViewDiffableDataSource<Section, CardController.Card>!
    var collectionView: UICollectionView!
    let searchBar = UISearchBar(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureDataSource()
        performQuery(with: nil)
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
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        view.addSubview(searchBar)
        
        let views = ["cv": collectionView!, "searchBar": searchBar] as [String : Any]
        var constraints = [NSLayoutConstraint]()
        constraints.append(contentsOf: NSLayoutConstraint.constraints(
                            withVisualFormat: "H:|[cv]|",
                            options: [],
                            metrics: nil,
                            views: views)
        )
        constraints.append(contentsOf: NSLayoutConstraint.constraints(
                            withVisualFormat: "H:|[searchBar]|",
                            options: [],
                            metrics: nil,
                            views: views)
        )
        constraints.append(contentsOf: NSLayoutConstraint.constraints(
                            withVisualFormat: "V:|-20-[cv]-20-[searchBar]-20-|",
                            options: [],
                            metrics: nil,
                            views: views)
        )
        constraints.append(searchBar.bottomAnchor.constraint(
                            equalToSystemSpacingBelow: view.safeAreaLayoutGuide.bottomAnchor,
                            multiplier: 1.0))
        NSLayoutConstraint.activate(constraints)
        
        searchBar.delegate = self
    }
    
    func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<CardCell, CardController.Card> { (cell, indexPath, card) in
            cell.nameLabel.text = card.name
            cell.costLabel.text = card.cost
            cell.imageView.image = card.image
            cell.effectLabel.text = card.effect
            cell.attackLabel.text = card.attack
            cell.defenseLabel.text = card.defense
            cell.backgroundColor = .systemBackground
            if cell.attackLabel.text == "" {
                cell.attackLabel.isHidden = true
            }
            if cell.defenseLabel.text == "" {
                cell.defenseLabel.isHidden = true
            }
        }
        

        
        dataSource = UICollectionViewDiffableDataSource<Section, CardController.Card>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, card: CardController.Card) -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: card)
        }
    }
    
    func performQuery(with filter: String?) {
        let cards = cardsController.filteredCards(with: filter).sorted { $0.cost < $1.cost }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, CardController.Card>()
        snapshot.appendSections([.main])
        snapshot.appendItems(cards)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension CardViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        performQuery(with: searchText)
    }
}

