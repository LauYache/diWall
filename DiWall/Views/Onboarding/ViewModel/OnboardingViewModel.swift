//
//  OnboardingViewModel.swift
//  DiWall
//
//  Created by Laura Belen Yachelini on 06/06/2024.
//

import Foundation
import Observation

@Observable
final class OnboardingViewModel {
  private var coordinator: MainCoordinatable
  
  init(coordinator: MainCoordinatable) {
    self.coordinator = coordinator
  }
  
  func onStartTapped() {
    UserDefaults.standard.set(true, forKey: "hasSeenOnboarding")
    coordinator.didEndOnboarding()
  }
}
