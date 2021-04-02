//
//  CardCell.swift
//  TrainingCollectionView
//
//  Created by daito yamashita on 2021/03/30.
//

import UIKit

class CardCell: UICollectionViewCell {
    static let reuseIdentifier = "card-cell-reuse-identifier"
    let imageView = UIImageView()
    let costLabel = UILabel()
    let nameLabel = UILabel()
    let effectLabel = UILabel()
    let attackLabel = UILabel()
    let defenseLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure() {
//        let spacing = CGFloat(5)
        let width = contentView.frame.width
        let height = contentView.frame.height
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        costLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        effectLabel.translatesAutoresizingMaskIntoConstraints = false
        attackLabel.translatesAutoresizingMaskIntoConstraints = false
        defenseLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(imageView)
        contentView.addSubview(costLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(effectLabel)
        contentView.addSubview(attackLabel)
        contentView.addSubview(defenseLabel)
        
        costLabel.layer.borderColor = UIColor.black.cgColor
        costLabel.layer.borderWidth = 1
        costLabel.layer.cornerRadius = width/16
        costLabel.textAlignment = .center
        costLabel.textColor = .black
        costLabel.backgroundColor = UIColor.orange
        costLabel.layer.masksToBounds = true
        // 横幅に文字を収める
        costLabel.adjustsFontSizeToFitWidth = true
        
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 4
        imageView.backgroundColor = UIColor.green
        imageView.layer.masksToBounds = true
        
        nameLabel.layer.borderColor = UIColor.black.cgColor
        nameLabel.layer.borderWidth = 1
        nameLabel.layer.cornerRadius = 4
        nameLabel.textAlignment = .center
        nameLabel.textColor = .black
        nameLabel.font = nameLabel.font.withSize(height/12)
        nameLabel.backgroundColor = UIColor.yellow
        nameLabel.layer.masksToBounds = true
        // 横幅に文字を収める
        nameLabel.adjustsFontSizeToFitWidth = true

        effectLabel.layer.borderColor = UIColor.black.cgColor
        effectLabel.layer.borderWidth = 1
        effectLabel.layer.cornerRadius = 4
        effectLabel.textAlignment = .center
        effectLabel.textColor = .black
        effectLabel.font = effectLabel.font.withSize(width/20)
        effectLabel.backgroundColor = UIColor.gray
        effectLabel.layer.masksToBounds = true
        // 折り返して表示
        effectLabel.lineBreakMode = .byWordWrapping
        effectLabel.numberOfLines = 0

        attackLabel.layer.borderColor = UIColor.black.cgColor
        attackLabel.layer.borderWidth = 1
        attackLabel.layer.cornerRadius = width/16
        attackLabel.textAlignment = .center
        attackLabel.textColor = .black
        attackLabel.backgroundColor = UIColor.red
        attackLabel.layer.masksToBounds = true
        // 横幅に文字を収める
        attackLabel.adjustsFontSizeToFitWidth = true

        defenseLabel.layer.borderColor = UIColor.black.cgColor
        defenseLabel.layer.borderWidth = 1
        defenseLabel.layer.cornerRadius = width/16
        defenseLabel.textAlignment = .center
        defenseLabel.textColor = .black
        defenseLabel.backgroundColor = UIColor.blue
        defenseLabel.layer.masksToBounds = true
        // 横幅に文字を収める
        defenseLabel.adjustsFontSizeToFitWidth = true
        
        NSLayoutConstraint.activate([
            costLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            costLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            costLabel.widthAnchor.constraint(equalToConstant: width/8),
            costLabel.heightAnchor.constraint(equalToConstant: width/8),
  
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: height/2),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: height/12),
            
            effectLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            effectLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            effectLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            effectLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                        
            attackLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            attackLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            attackLabel.widthAnchor.constraint(equalToConstant: width/8),
            attackLabel.heightAnchor.constraint(equalToConstant: width/8),
            
            defenseLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            defenseLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            defenseLabel.widthAnchor.constraint(equalToConstant: width/8),
            defenseLabel.heightAnchor.constraint(equalToConstant: width/8)
        ])
    }
}
