//
//  QuickStartViewModel.swift
//  DiWall
//
//  Created by Laura Belen Yachelini on 23/05/2024.
//

import Foundation

class QuickStartViewModel: ObservableObject {
  @Published var data = QuickStartData()
  @Published var currentStep: Step = .selectGoal
  
  enum Step {
    case selectGoal
    case enterSavingTime
    case enterMonthlySaving
    case showPlan
  }
  
  
  func continueAction() {
    guard let savingGoal = data.savingGoal else { return }
    switch currentStep {
    case .selectGoal:
      currentStep = .enterSavingTime
    case .enterSavingTime:
      currentStep = .enterMonthlySaving
    case .enterMonthlySaving:
      currentStep = .showPlan
    case .showPlan:
      calculatePlan()
    }
    
  }
  
  func calculatePlan() -> String {
    guard let goal = data.savingGoal, let time = data.savingTime, let monthlySaving = data.monthlySaving else {
      return "Faltan datos para calcular el plan."
    }
    
    let totalSavings = Double(time) * monthlySaving
    return "Para tu objetivo de \(goal.rawValue), ahorrarás un total de \(totalSavings) en \(time) meses, ahorrando \(monthlySaving) por mes."
  }
}




