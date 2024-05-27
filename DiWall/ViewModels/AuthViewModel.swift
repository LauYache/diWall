//
//  AuthViewModel.swift
//  DiWall
//
//  Created by Laura Belen Yachelini on 22/05/2024.
//

import Foundation
import Combine

class AuthViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    @Published var isAuthenticated = false
    @Published var showAlert = false

    private let authService = AuthService()

    func login() {
        authService.login(username: username, password: password) { success in
            DispatchQueue.main.async {
                self.isAuthenticated = success
                if !success {
                  
                  //cambiar a true
                    self.showAlert = true
                }
            }
        }
    }
}
