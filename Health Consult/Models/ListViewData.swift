//
//  ListViewData.swift
//  Health Consult
//
//  Created by Deepanshu Gautam on 13/10/20.
//  Copyright © 2020 Deepanshu Gautam. All rights reserved.
//

import Foundation

struct ListViewData {
    let listCells = [
        ["Don't Panic!", "The Proper Supplies", "Gathering Medical Information", "Calling Emergency Number", "Universal Precautions", "The Proper Training"],
        ["History of CPR", "The ABCs of First Aid", "Basic CPR and AED", "Recovery Position", "Signs of Heart Attack", "Choking", "Heimlich Maneuver", "Swallowing Foreign Objects", "Managing Shock"],
        ["Cuts (Lacerations)", "Puncture Wounds", "Infections Due to Cuts", "Tooth Loss, Dental Pain and Dental Injuries", "Diabetic Emergencies", "Earache and Ear Injury", "Food Poisoning", "Allergic Reactions"],
        ["Animal, Human and Insect Bites", "Insect Stings", "Poison Ivy, Oak and Sumac", "Frosbite and Hypothermia", "Snow Blindness", "Dehydration", "Heat Emergencies", "Jellyfish Stings"],
        ["Burns (Thermal, Chemical and Other)", "Sunburn", "Electrical Injury", "Head Injuries and Head Trauma", "Headace and Head Pain", "Abdominal Pain", "Nausea and Vomiting", "Asthma Attack"],
        ["Bleeding", "Internal Bleeding/Blunt Trauma", "Penetrating Trauma", "Special Injury", "Stroke", "Poisoning", "Drug Overdose", "Near Drowning", "Carbon-Monoxide Poisoning"],
        ["Fever", "Febrile Seizures", "Seizures", "Fainting", "Sore Throat", "Croup", "Black Eyes", "Broken Nose", "Nosebleed", "Motion Sickness", "High Blood Pressure (Hypertension)", "Panic Attacks"],
        ["Childbirth (Emergency Delivery)", "Miscarriage", "Tetanus", "Rabies", "Severed Limb", "Sprains", "Broken Bones", "Fractures of the Pelvis", "Dislocatoins", "Smoke Inhalation"]
    ]
    func getNumberOfListCell(collectionCellNumber: Int) -> Int {
        return listCells[collectionCellNumber].count
    }
}
