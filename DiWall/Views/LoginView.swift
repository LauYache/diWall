//
//  LoginView.swift
//  DiWall
//
//  Created by Laura Belen Yachelini on 20/05/2024.
//

import SwiftUI

struct LoginView: View{
  @ObservedObject var viewModel = AuthViewModel()
    
    @State var isActive = false
  var backgroundColor: Color = .electricBlue
    
    var body: some View{
        
      NavigationStack{
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
                  isActive = true
              } label: {
                Text("Login")
                  .foregroundStyle(.white)
                  .modifier(RoundedBotton(color: .white.opacity(0.5), letterColor: .orange.opacity(0.5)))
                
              }
              .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Acceso invalido"), message: Text("Por favor ingrese de nuevo sus datos"), dismissButton: .default(Text("OK")))
              }
              
              NavigationLink {
                QuickStartView()
              } label: {
                Text("Quick start")
                  .modifier(RoundedBotton(color: .white.opacity(0.5), letterColor: .electricBlue))
              }
            }
          }

          }
          
        }
      .fullScreenCover(isPresented: $isActive, content: {
              PrincipalView()
          })
      }
    }


#Preview {
  LoginView(backgroundColor: .electricBlue)
}

