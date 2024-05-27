//
//  AuthService.swift
//  DiWall
//
//  Created by Laura Belen Yachelini on 22/05/2024.
//

import Foundation

class AuthService {
    private var validUsername = "user"
    private var validPassword = "password"

    func login(username: String, password: String, completion: @escaping (Bool) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            if username == self.validUsername && password == self.validPassword {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
