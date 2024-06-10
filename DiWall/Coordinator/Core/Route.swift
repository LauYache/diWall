//
//  Route.swift
//  DiWall
//
//  Created by Laura Belen Yachelini on 06/06/2024.
//

enum Route: Hashable {
  case splash
  case main
  case onboarding
  case login
  case principal
  case quickStart
}

extension Route {
  static func == (lhs: Route, rhs: Route) -> Bool {
    switch (lhs, rhs) {
    case (.splash, .splash), (.main, .main),
      (.onboarding, .onboarding), (.login, .login), 
      (.principal, .principal), (.quickStart, .quickStart):
      return true
    default:
      return false
    }
  }
}
