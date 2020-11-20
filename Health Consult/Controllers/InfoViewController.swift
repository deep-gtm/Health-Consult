//
//  InforViewController.swift
//  Health Consult
//
//  Created by Deepanshu Gautam on 16/10/20.
//  Copyright © 2020 Deepanshu Gautam. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var infoViewBrain = InfoViewData()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoViewBrain.data[cellNumberSelected! - 1][rowSelected!].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.collection.informationCellIdentifier, for: indexPath) as! InformationViewCell
        cell.informationCellHeadingLabel.text = infoViewBrain.data[cellNumberSelected! - 1][rowSelected!][indexPath.row].heading
        cell.informationCellTaxtLabel.text = infoViewBrain.data[cellNumberSelected! - 1][rowSelected!][indexPath.row].text
        cell.informationCellHeadingLabel.backgroundColor = infoViewBrain.data[cellNumberSelected! - 1][rowSelected!][indexPath.row].headingLabelColor
        return cell
        
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var informationHeading: UILabel!
    
    var cellNumberSelected: Int?
    var rowSelected: Int?
    var informationName: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "InformationViewCell", bundle: nil )
        tableView.register(nib, forCellReuseIdentifier: K.collection.informationCellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        informationHeading.text = informationName
        title = K.navigationBarTitle
        navigationController?.navigationItem.hidesBackButton = false
    }
}
