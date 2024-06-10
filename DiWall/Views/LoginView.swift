//
//  LoginView.swift
//  DiWall
//
//  Created by Laura Belen Yachelini on 20/05/2024.
//

import SwiftUI

struct LoginView: View{
  @State private var viewModel: AuthViewModel
  private var backgroundColor: Color = .electricBlue
  
  init(viewModel: @autoclosure @escaping () -> AuthViewModel) {
    self._viewModel = State(wrappedValue: viewModel())
  }
  
  var body: some View{
    ZStack{
      backgroundColor
        .ignoresSafeArea()
      
      VStack(spacing: 16){
        
        Text("Bienvenido")
          .font(.largeTitle)
          .foregroundStyle(Color.white)
          .fontWeight(.bold)
        Text("Por favor ingresa tu cuenta")
          .font(.footnote)
          .foregroundStyle(.orange)
        
        VStack(spacing: 20){
          HStack{
            
            Image(systemName: "envelope")
              .fontWeight(.semibold)
              .foregroundStyle(.gray)
            
            TextField("User/Mail", text: $viewModel.username)
              .textInputAutocapitalization(.never)
              .font(.subheadline)
              .padding(12)
              .cornerRadius(12)
          }
          .modifier(TextViewModifier())
          
          HStack{
            
            Image(systemName: "envelope")
              .fontWeight(.semibold)
              .foregroundStyle(.gray)
            
            SecureField("Password", text: $viewModel.password)
              .textInputAutocapitalization(.never)
              .font(.subheadline)
              .padding(12)
              .cornerRadius(12)
            
            Button{
              //show password
            }label: {
              Image(systemName: "eye")
                .foregroundStyle(.gray)
            }
          }
          .modifier(TextViewModifier())
          
          HStack{
            Spacer()
            
            Button(action:{
              
              
            },label: {
              Text("Recuperar contraseña?")
                .foregroundStyle(.orange)
            })
          }
          .padding(.trailing, 24)
        }
        .padding([.leading, .trailing], 50)
        
        //Login button
        HStack{
          Button{
            viewModel.login()
          } label: {
            Text("Login")
              .foregroundStyle(.white)
              .modifier(RoundedBotton(color: .white.opacity(0.5), letterColor: .orange.opacity(0.5)))
            
          }
          .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Acceso invalido"), message: Text("Por favor ingrese de nuevo sus datos"), dismissButton: .default(Text("OK")))
          }
          
          Button {
            viewModel.onTapQuickStart()
          } label: {
            Text("Quick start")
              .modifier(RoundedBotton(color: .white.opacity(0.5), letterColor: .electricBlue))
          }
        }
      }
      
    }
    .navigationBarBackButtonHidden()
  }
}


#Preview {
  LoginView(viewModel: AuthViewModel(coordinator: MainCoordinatorMock()))
}

