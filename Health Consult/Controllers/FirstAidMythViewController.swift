//
//  FirstAidMythViewController.swift
//  Health Consult
//
//  Created by Deepanshu Gautam on 13/10/20.
//  Copyright © 2020 Deepanshu Gautam. All rights reserved.
//

import UIKit

class FirstAidMythViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var firstAidMythBrain = FirstAidMythScreenData()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firstAidMythBrain.textArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.collection.mythCellIdentifier, for: indexPath) as! FirstAidMythTableCell
        cell.cellCount.text = "\(indexPath.row + 1)"
        cell.cellText.text = firstAidMythBrain.textArray[indexPath.row]
        return cell
    }
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "FirstAidMythTableCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: K.collection.mythCellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        title = K.navigationBarTitle
        navigationController?.navigationItem.hidesBackButton = false
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
