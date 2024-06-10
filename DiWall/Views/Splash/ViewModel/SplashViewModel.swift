//
//  SplashViewModel.swift
//  DiWall
//
//  Created by Laura Belen Yachelini on 06/06/2024.
//

import Foundation
import Observation

@Observable
final class SplashViewModel {
  var coordinator: MainCoordinatable
  
  init(coordinator: MainCoordinatable) {
    self.coordinator = coordinator
  }
  
  func onAppear() {
      DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) { [weak self] in
        self?.coordinator.didEndSplash()
      }
  }
}
