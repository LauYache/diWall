//
//  AuthViewModel.swift
//  DiWall
//
//  Created by Laura Belen Yachelini on 22/05/2024.
//

import Foundation
import Combine
import Observation

@Observable
final class AuthViewModel {
  var username = ""
  var password = ""
  var showAlert = false
  var isAuthenticated = false
  
  @ObservationIgnored private let authService = AuthService()
  @ObservationIgnored private let coordinator: MainCoordinatable
  
  init(coordinator: MainCoordinatable) {
    self.coordinator = coordinator
  }
  
  func login() {
    authService.login(username: username, password: password) { [weak self] success in
      self?.isAuthenticated = success
      DispatchQueue.main.async {
        if !success {
          //cambiar a true
          self?.showAlert = true
          return
        }
        self?.coordinator.didLogin()
      }
    }
  }
  
  func onTapQuickStart() {
    coordinator.didTapQuickStart()
  }
}
