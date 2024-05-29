//
//  DiWallCloneViewModel.swift
//  DiWall
//
//  Created by Jairo Laurente Celis on 29/05/24.
//

import Foundation
import SwiftUI

class DiWallCloneViewModel: ObservableObject{
    
    @Published var diWall: [DiWallModel] = []
    @Published var wall: DiWallModel?
    @Published var diWallSavings: [DiWallModel] = []
    @Published var diWallExpenses: [DiWallModel] = []
   
    
    func addSavings(savings: Double){
        let newWall = DiWallModel(expense: 0, savings: savings)
        diWallSavings.append(newWall)
    }
    func addExpenses(expenses: Double){
        let newWall = DiWallModel(expense: expenses, savings: 0)
        diWallExpenses.append(newWall)
    }
    
}
