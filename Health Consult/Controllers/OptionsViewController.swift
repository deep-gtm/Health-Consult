//
//  OptionsViewController.swift
//  Health Consult
//
//  Created by Deepanshu Gautam on 11/10/20.
//  Copyright © 2020 Deepanshu Gautam. All rights reserved.
//

import UIKit
import Firebase
class OptionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let options = [
        ["📞Contact Developers","❗️ About"],
        ["⚠️ Log Out"]
    ]
    
    let optionsInfoText = [
        "We All Are Students of IIT BHU Mathematical Sciences Department.\nGayatri Chetri : gayatri.chetri.mat19@itbhu.ac.in (Lead Developer)\nDewansh Doley : dewansh.doley.mat19@itbhu.ac.in (Assistant Developer)\nDeepanshu: deepanshu.student.mat19@itbhu.ac.in (Assistant Developer)","Everyone faces some emergency in health condition in their life or their loved ones or simply other people.  Accidents are unpredictable , so we need to know the first aid for the basic health problems.\nSo , our app \"HEALTH CONSULT\" aims to give instruction to handle first aid . This can save one’s life. It provide you the instructions and you can help the person in need , rather from being simply bystanders .\nThrough our App \"HEALTH CONSULT\" we want to help people in need. This app will give one the instant access to the information one needs to know to handle the emergencies."
    ]
    
    var rowSelected = 0
    var sectionSelected = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "optionsCell", for: indexPath)
        cell.layer.cornerRadius = cell.frame.height / 4
        cell.textLabel?.text = options[indexPath.section][indexPath.row]
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return " "
        } else {
            return " "
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                rowSelected = indexPath.row
                sectionSelected = indexPath.section
                self.performSegue(withIdentifier: K.segues.optionInfoSegue, sender: self)
            } else if indexPath.row == 1 {
                rowSelected = indexPath.row
                sectionSelected = indexPath.section
                self.performSegue(withIdentifier: K.segues.optionInfoSegue, sender: self)
            }
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                let alert = UIAlertController(title: "Do You Want To LogOut", message: "", preferredStyle: .alert)
                let yesAction = UIAlertAction(title: "YES", style: .default) { (yesAction) in
                    let firebaseAuth = Auth.auth()
                    do {
                      try firebaseAuth.signOut()
                        K.defaults.set(false, forKey: K.login)
                        self.performSegue(withIdentifier: K.segues.optioinsToLogRegSegue, sender: self)
                        K.defaults.set("Nil", forKey: K.fireBaseCloudStoreDocumentKey.name)
                    } catch let signOutError as NSError {
                      print ("Error signing out: %@", signOutError)
                    }
                }
                let noAction = UIAlertAction(title: "NO", style: .cancel) { (noAction) in
                    
                }
                alert.addAction(yesAction)
                alert.addAction(noAction)
                present(alert, animated: true, completion: nil)
            }
        }
    }
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = K.navigationBarTitle
        navigationItem.hidesBackButton = false
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.segues.optionInfoSegue {
            let destinationVC = segue.destination as! OptionInfoViewController
            destinationVC.headingText = options[sectionSelected][rowSelected]
            destinationVC.infoText = optionsInfoText[rowSelected]
        }
    }
}
