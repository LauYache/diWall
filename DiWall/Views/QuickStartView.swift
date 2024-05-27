//
//  QuickStartView.swift
//  DiWall
//
//  Created by Laura Belen Yachelini on 23/05/2024.
//

import SwiftUI

import SwiftUI

struct QuickStartView: View {
    @StateObject private var viewModel = QuickStartViewModel()

    var body: some View {
      
      ZStack {
        Color.electricBlue.ignoresSafeArea()
        VStack {
              switch viewModel.currentStep {
              case .selectGoal:
                  selectGoalView
              case .enterSavingTime:
                  enterSavingTimeView
              case .enterMonthlySaving:
                  enterMonthlySavingView
              case .showPlan:
                  showPlanView
              }


              // Botón de "Continuar"
              Button(action: {
                  viewModel.continueAction()
              }) {
                  Text("Continuar")
                      .font(.headline)
                      .foregroundColor(.white)
                      .padding()
                      .frame(maxWidth: .infinity)
                      .background(Color.white.opacity(0.5))
                      .cornerRadius(10)
                      .padding()
              }

        }


      }
    }

    private var selectGoalView: some View {
        VStack {
            Text("¿Cuál es tu objetivo de ahorro?")
                .font(.title2)
                .foregroundStyle(.white)
                .padding()

            ForEach(SavingGoalModel.allCases) { goal in
                Button(action: {
                    viewModel.data.savingGoal = goal
                }) {
                    HStack {
                        Text(goal.rawValue)
                            .font(.headline)
                            .padding()
                        if viewModel.data.savingGoal == goal {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.accentColor)
                                .padding()
                        }
                    }
                  
                  
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.accentColor.opacity(0.5), lineWidth: 2))
                }
              
                .padding(.horizontal)
                .padding(.vertical, 5)
            }
        }
    }

    private var enterSavingTimeView: some View {
        VStack {
            Text("¿Cuántos meses tienes para ahorrar?")
            .font(.title2)
            .foregroundStyle(.white)
            .padding()

            TextField("Meses", value: $viewModel.data.savingTime, formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
          
        }
    }

    private var enterMonthlySavingView: some View {
        VStack {
            Text("¿Cuánto puedes ahorrar por mes?")
                .font(.title2)
                .foregroundStyle(.white)
                .padding()

            TextField("Monto mensual", value: $viewModel.data.monthlySaving, formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
    }

    private var showPlanView: some View {
        VStack {
            Text("Plan de Ahorro")
            .font(.title2)
            .foregroundStyle(.white)
            .padding()

            Text(viewModel.calculatePlan())
                .font(.headline)
                .padding()
        }
    }
}

#Preview {
  QuickStartView()
}
