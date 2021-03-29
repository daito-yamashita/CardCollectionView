//
//  ViewController.swift
//  TestModernCollection
//
//  Created by daito yamashita on 2021/03/29.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
   
    let numbers = [Int](0..<100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let collectionViewCell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        let labelNumber = collectionViewCell.contentView.viewWithTag(0) as! UILabel
        labelNumber.text = String(numbers[indexPath.row])
        
        return collectionViewCell
    }
    
}

