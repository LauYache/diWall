//
//  SavingGoalModel.swift
//  DiWall
//
//  Created by Laura Belen Yachelini on 23/05/2024.
//

import Foundation

enum SavingGoalModel: String, Identifiable, CaseIterable{
  
    case emergencyFund = "Fondo de emergencia"
     case vacation = "Vacaciones"
     case retirement = "Jubilación"
     case education = "Educación"
     
     var id: String { self.rawValue }
}
