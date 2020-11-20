//
//  K.swift
//  Health Consult
//
//  Created by Deepanshu Gautam on 09/10/20.
//  Copyright © 2020 Deepanshu Gautam. All rights reserved.
//

import UIKit
struct K {
    static let appName = "HEALTH CONSULT 👩🏻‍⚕️"
    static let navigationBarTitle = "HEALTH CONSULT"
    
    struct segues {
        static let introLogRegSegue = "introToLoginRegisterScreen"
        static let registerToUserSegue = "registerToUserScreen"
        static let loginToUserSegue = "loginToUserScreen"
        static let introToUserSegue = "introToUserScreen"
        static let optioinsToLogRegSegue = "optionsToLogRegScreen"
        static let bmiCalcToResultSegue = "calculatorToResultScreen"
        static let cellToListSegue = "cellToListScreen"
        static let firstAidMythSegue = "firstAidMyths"
        static let listToIntroSegue = "listToInfo"
        static let optionInfoSegue = "OptionInfo"
    }
    struct colors {
        static let backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        static let foregroundColor = #colorLiteral(red: 0.1921568627, green: 0.2901960784, blue: 0.4745098039, alpha: 1)
    }
    
    struct fireBaseCloudStoreDocumentKey {
        static let name = "Name"
    }
    
    struct collection {
        static let collectionCellIdentifier = "myUserCell"
        static let listCellIdentifier = "listCell"
        static let mythCellIdentifier = "mythCells"
        static let informationCellIdentifier = "informationCell"
    }
    
    static let defaults = UserDefaults.standard
    static let login = "isLogin"
}
