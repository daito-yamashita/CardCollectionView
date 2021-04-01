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
        let spacing = CGFloat(5)
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
        costLabel.layer.cornerRadius = width/20
        costLabel.textAlignment = .center
        costLabel.textColor = .black
        costLabel.backgroundColor = UIColor.orange
        
        nameLabel.layer.borderColor = UIColor.black.cgColor
        nameLabel.layer.borderWidth = 1
        nameLabel.layer.cornerRadius = 4
        nameLabel.textAlignment = .center
        nameLabel.textColor = .black
        nameLabel.backgroundColor = UIColor.yellow
  
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 4
        imageView.backgroundColor = UIColor.green
        
        effectLabel.layer.borderColor = UIColor.black.cgColor
        effectLabel.layer.borderWidth = 1
        effectLabel.layer.cornerRadius = 4
        effectLabel.textAlignment = .center
        effectLabel.textColor = .black
        effectLabel.backgroundColor = UIColor.gray

        attackLabel.backgroundColor = UIColor.red
        attackLabel.layer.borderColor = UIColor.black.cgColor
        attackLabel.layer.borderWidth = 1
        attackLabel.layer.cornerRadius = height/20
        attackLabel.textAlignment = .center
        attackLabel.textColor = .black


        defenseLabel.layer.borderColor = UIColor.black.cgColor
        defenseLabel.layer.borderWidth = 1
        defenseLabel.layer.cornerRadius = height/20
        defenseLabel.textAlignment = .center
        defenseLabel.textColor = .black
        defenseLabel.backgroundColor = UIColor.blue
        
        NSLayoutConstraint.activate([
            costLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            costLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            costLabel.widthAnchor.constraint(equalToConstant: width/10),
            costLabel.heightAnchor.constraint(equalToConstant: width/10),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: costLabel.trailingAnchor, constant: spacing),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalTo: costLabel.heightAnchor),

            
            imageView.topAnchor.constraint(equalTo: costLabel.bottomAnchor, constant: spacing),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 60),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            effectLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: spacing),
            effectLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            effectLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            effectLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            effectLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                        
            attackLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            attackLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            attackLabel.widthAnchor.constraint(equalToConstant: height/10),
            attackLabel.heightAnchor.constraint(equalToConstant: height/10),
            
            defenseLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            defenseLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            defenseLabel.widthAnchor.constraint(equalToConstant: height/10),
            defenseLabel.heightAnchor.constraint(equalToConstant: height/10)
        ])
        
    }
}
