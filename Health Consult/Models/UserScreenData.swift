//
//  UserScreenData.swift
//  Health Consult
//
//  Created by Deepanshu Gautam on 13/10/20.
//  Copyright © 2020 Deepanshu Gautam. All rights reserved.
//

import Foundation
import UIKit
struct UserScreenData {
    let cellNamesArray = [
        "First-Aid Myths", "First-Aid Basics", "Emergency Response", "Common In-Home Incidents", "Outdoor Events", "Anywhere Events", "Serious Incidents", "Common Conditions", "Emergency Events"
    ]
    let cellImagesArray = [
        #imageLiteral(resourceName: "First Aid Myths"), #imageLiteral(resourceName: "First Aid Basics"), #imageLiteral(resourceName: "Emergency Response"), #imageLiteral(resourceName: "Common In Home Incidents"), #imageLiteral(resourceName: "Outdoor Events"), #imageLiteral(resourceName: "AnyWhere Events"), #imageLiteral(resourceName: "Serious Incidents") , #imageLiteral(resourceName: "Common Conditions"), #imageLiteral(resourceName: "Emergency Events")
    ]
    
    func getCellName(indexOfCell: Int) -> String {
        return cellNamesArray[indexOfCell]
    }
    
    func getCellImage(indexOfCell: Int) -> UIImage {
        return cellImagesArray[indexOfCell]
    }
    
    func getCellCount() -> Int {
        return cellNamesArray.count
    }
}
