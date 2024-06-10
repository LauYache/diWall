//
//  MainCoordinator.swift
//  DiWall
//
//  Created by Laura Belen Yachelini on 06/06/2024.
//

import Observation
import SwiftUI

@Observable
final class MainCoordinator: Coordinatable {
  @ObservationIgnored private var showOnboarding = !UserDefaults.standard.bool(forKey: "hasSeenOnboarding")
  
  var path: [Route] = []
  
  func routeTo(_ route: Route, style: PresentationStyle) {
    path.append(route)
  }
  
  func root(_ root: Route) {
    path = []
  }
  
  func rootView() -> some View {
    getDestination(for: .splash)
  }
  
  @ViewBuilder
  func getDestination(for page: Route) -> some View {
    switch page {
    case .splash:
      makeSplash()
    case .main:
      getMain()
    case .onboarding:
      makeOnboarding()
    case .login:
      makeLogin()
    case .principal:
      makePrincipal()
    case .quickStart:
      makeQuickStart()
    }
  }
  
  @ViewBuilder
  private func getMain() -> some View {
    if showOnboarding {
      makeOnboarding()
    } else {
      makeLogin()
    }
  }
}

extension MainCoordinator: MainCoordinatable {
  func didEndSplash() {
    routeTo(.main, style: .push)
  }
  
  func didEndOnboarding() {
    routeTo(.login, style: .push)
  }
  
  func didLogin() {
    routeTo(.principal, style: .push)
  }
  
  func didTapQuickStart() {
    routeTo(.quickStart, style: .push)
  }
}

// MARK: Factory
extension MainCoordinator {
  private func makeSplash() -> some View {
    SplashView(viewModel: SplashViewModel(coordinator: self))
  }
  
  private func makeOnboarding() -> some View {
    OnboardingView(viewModel: OnboardingViewModel(coordinator: self))
  }
  
  private func makeLogin() -> some View {
    LoginView(viewModel: AuthViewModel(coordinator: self))
  }
  
  private func makePrincipal() -> some View {
    PrincipalView()
  }
  
  private func makeQuickStart() -> some View {
    QuickStartView()
  }
}
