//
//  DiWallApp.swift
//  DiWall
//
//  Created by Laura Belen Yachelini on 20/05/2024.
//

import SwiftUI

@main
struct DiWallApp: App {
  @State private var coordinator = MainCoordinator()
  
  var body: some Scene {
    @Bindable var stack = self.coordinator
    WindowGroup {
      NavigationStack(path: $stack.path) {
        coordinator
          .rootView()
          .navigationDestination(for: Route.self) { page in
            coordinator.getDestination(for: page)
          }
      }
      .environment(coordinator)
    }
  }
}
