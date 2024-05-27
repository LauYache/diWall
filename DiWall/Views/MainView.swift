//
//  MainView.swift
//  DiWall
//
//  Created by Laura Belen Yachelini on 22/05/2024.
//

import SwiftUI

struct MainView: View {
  @StateObject var authViewModel = AuthViewModel()
  @State private var showSplash = true
  @State private var showOnboarding = !UserDefaults.standard.bool(forKey: "hasSeenOnboarding")
  
  var body: some View {
    VStack {
      if showSplash {
        SplashView()
          .transition(.opacity)
      } else {
        if showOnboarding {
          OnboargingView(showOnboarding: $showOnboarding)
            .transition(.opacity)
        }else if authViewModel.isAuthenticated {
          DashboardView()
            .transition(.opacity)
        } else {
          LoginView(viewModel: authViewModel)
            .transition(.opacity)
        }
      }
    }
    .onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
        withAnimation {
          self.showSplash = false
        }
      }
    }
  }
}

#Preview {
    MainView()
}
