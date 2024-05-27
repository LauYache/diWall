//
//  OnboargingView.swift
//  DiWall
//
//  Created by Laura Belen Yachelini on 22/05/2024.
//

import SwiftUI

struct OnboargingView: View {
  @Binding var showOnboarding:Bool
    var body: some View {
      NavigationView {
        ZStack {
          Color.electricBlue
            .ignoresSafeArea()
          TabView {
            OnboardingPageView(imageName: "heart", title: "Bienvenido a DiWall", description: """
                               ¡Bienvenido a nuestra app!
                               Rastrea tus gastos fácilmente.
                               """)
                       OnboardingPageView(imageName: "pencil.and.list.clipboard", title: "Organiza", description: "Organiza tus gastos por categorías.")
                       OnboardingPageView(imageName: "creditcard", title: "Ahorra", description: "Establece metas de ahorro y consíguelas.")
                       OnboardingPageView(imageName: "checkmark.seal", title: "Comienza", description: "¡Vamos a empezar!")
            {
                          withAnimation {
                              UserDefaults.standard.set(true, forKey: "hasSeenOnboarding")
                              showOnboarding = false
                          }
                      }
                  }
          .foregroundStyle(Color.accentColor)
          .tabViewStyle(PageTabViewStyle())
        }
      } // 4
          }
      }

struct OnboardingPageView: View {
  var imageName: String
  var title: String
  var description: String
  var action: (() -> Void)? = nil
  
  var body: some View {
  
  
      VStack {
        Spacer()
        Image(systemName: imageName)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 75, height: 75)
          .padding()
        Text(title)
          .font(.largeTitle)
          .bold()
          .padding()
          .multilineTextAlignment(.center)
          .foregroundColor(.white)
        Text(description)
          .font(.body)
          .padding()
          .foregroundColor(.white)
          .multilineTextAlignment(.center)
        
        if let action = action {
          NavigationLink(destination:LoginView())
          {
            Text("Comencemos")
              .padding()
              .background(Color.white.opacity(0.5))
              .foregroundColor(.electricBlue)
              .cornerRadius(8)
          }
          .padding()
        }
        Spacer()
      }
    }
  }

#Preview {
  OnboargingView(showOnboarding: .constant(true))
}
