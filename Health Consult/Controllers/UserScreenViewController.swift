//
//  UserScreenViewController.swift
//  Health Consult
//
//  Created by Deepanshu Gautam on 09/10/20.
//  Copyright © 2020 Deepanshu Gautam. All rights reserved.
//

import UIKit
import Firebase
class UserScreenViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var wantToKnowBmiButton: UIButton!
    @IBOutlet weak var bmiimage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var myCollectionView: UICollectionView!
    var userScreenBrain = UserScreenData()
    var cellSelected = 0
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userScreenBrain.getCellCount()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: K.collection.collectionCellIdentifier, for: indexPath) as! myCell
        cell.cellLabel.text = userScreenBrain.getCellName(indexOfCell: indexPath.row)
        cell.cellImageView.image = userScreenBrain.getCellImage(indexOfCell: indexPath.row)
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "myCell" , bundle: nil)
        myCollectionView.register(nib, forCellWithReuseIdentifier: K.collection.collectionCellIdentifier)
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        title = K.navigationBarTitle
        navigationItem.hidesBackButton = true
        if let name = K.defaults.string(forKey: K.fireBaseCloudStoreDocumentKey.name) {
            nameLabel.text = "Welcome, \(name)"
        }
        wantToKnowBmiButton.layer.cornerRadius = wantToKnowBmiButton.frame.height / 5
        bmiimage.layer.cornerRadius = bmiimage.frame.height / 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        cellSelected = indexPath.row
        if cellSelected == 0 {
            self.performSegue(withIdentifier: K.segues.firstAidMythSegue, sender: self)
        } else {
            self.performSegue(withIdentifier: K.segues.cellToListSegue, sender: self)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.segues.cellToListSegue {
            let destinationVC = segue.destination as! ListViewController
            destinationVC.image = userScreenBrain.getCellImage(indexOfCell: cellSelected)
            destinationVC.labelName = userScreenBrain.getCellName(indexOfCell: cellSelected)
            destinationVC.cellNumber = cellSelected
        }
    }
}


