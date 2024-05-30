//
//  DiWallModel.swift
//  DiWall
//
//  Created by Jairo Laurente Celis on 29/05/24.
//

import Foundation

struct DiWallModel: Identifiable{
    
    let id = UUID()
    var total : Double {
        expense + savings
    }
    let expense: Double
    let savings: Double
   
    
    static let example = DiWallModel(expense: 211, savings: 219)
}

