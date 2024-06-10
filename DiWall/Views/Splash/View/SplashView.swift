//
//  ContentView.swift
//  DiWall
//
//  Created by Laura Belen Yachelini on 18/05/2024.
//

import SwiftUI

struct SplashView: View {
  @State private var viewModel: SplashViewModel
  
  init(viewModel: @autoclosure @escaping () -> SplashViewModel) {
    self._viewModel = State(wrappedValue: viewModel())
  }
  
  var body: some View {
    ZStack{
      Color(.electricBlue)
        .ignoresSafeArea()
      VStack {
        Image(systemName: "dollarsign.arrow.circlepath")
          .resizable(resizingMode: .tile)
          .aspectRatio(contentMode: .fit)
          .frame(width: 70.0, height: 70.0)
          .foregroundStyle(.orange)
          .symbolEffect(.variableColor, isActive: true)
        HStack(spacing:0){
          Text("Di")
            .font(.largeTitle)
            .bold()
            .foregroundStyle(.white)
          Text("Wall")
            .font(.largeTitle)
            .bold()
            .foregroundStyle(.accent)
        }
      }
      .padding()
    }
    .onAppear(perform: viewModel.onAppear)
  }
}


#Preview {
  SplashView(viewModel: SplashViewModel(coordinator: MainCoordinatorMock()))
}
