//
//  ListViewController.swift
//  Health Consult
//
//  Created by Deepanshu Gautam on 13/10/20.
//  Copyright © 2020 Deepanshu Gautam. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    @IBOutlet weak var cellNameLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    var listViewBrain = ListViewData()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewBrain.getNumberOfListCell(collectionCellNumber: cellNumber! - 1)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.collection.listCellIdentifier, for: indexPath)
        cell.textLabel?.text = listViewBrain.listCells[cellNumber! - 1][indexPath.row]
        print(indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rowNumber = indexPath.row
        self.performSegue(withIdentifier: K.segues.listToIntroSegue, sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    var image: UIImage?
    var labelName: String?
    var cellNumber: Int?
    var rowNumber: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        cellNameLabel.text = labelName
        cellImage.image = image
        title = K.navigationBarTitle
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.segues.listToIntroSegue {
            let destinationVC = segue.destination as! InfoViewController
            destinationVC.cellNumberSelected = cellNumber
            destinationVC.rowSelected = rowNumber
            destinationVC.informationName = listViewBrain.listCells[(cellNumber! - 1)][rowNumber!]
        }
    }
    
    
    
    
    
    
}
