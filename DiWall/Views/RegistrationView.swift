//
//  RegistrationView.swift
//  DiWall
//
//  Created by Laura Belen Yachelini on 20/05/2024.
//

import SwiftUI

struct RegistrationView: View{
  @State var email: String
  @State var password: String
  @State var isPasswordValidLenght = false
  @State var isPasswordWithNumber = false
  @State var isShowingPassword = false
  @State var isPasswordIsValid = false
  var body: some View{
    

    ZStack{
    
      VStack(spacing: 16){
        Text("Bienvenido!")
          .font(.largeTitle)
          .fontWeight(.bold)
          .foregroundStyle(Color.electricBlue)
        Text("Por favor ingrese su cuenta")
          .font(.footnote)
          .foregroundStyle(.gray)
        VStack(spacing: 20){
          HStack{
            Image(systemName: "envelope")
              .fontWeight(.semibold)
              .foregroundStyle(.gray)
            TextField("Email", text: $email)
              .font(.subheadline)
              .padding(12)
              .cornerRadius(12)
          }
          .modifier(TextViewModifier())
          HStack{
            Image(systemName: "rectangle.and.pencil.and.ellipsis")
              .fontWeight(.semibold)
              .foregroundStyle(.gray)
            if isShowingPassword {
              TextField("Password", text: $password)
                .font(.subheadline)
                .padding(12)
                .cornerRadius(12)
            } else {
              SecureField("Password", text: $password)
                .font(.subheadline)
                .padding(12)
                .cornerRadius(12)
            }
            Button{
              isShowingPassword.toggle()
            }label: {
              Image(systemName: isShowingPassword ? "eye" : "eye.slash")
                .foregroundColor(.gray)
            }
          }
          .modifier(TextViewModifier())
          VStack(spacing: 16){
            Text("Tu contrasena debe contener:")
            VStack{
              HStack{
                Image(systemName: isPasswordValidLenght ? "checkmark.circle.fill" : "checkmark.circle")
                  .foregroundColor(isPasswordValidLenght ? .green : . gray)
                Text("Al menos 6 caracteres")
              }
              HStack{
                Image(systemName: isPasswordWithNumber ? "checkmark.circle.fill" : "checkmark.circle")
                  .foregroundColor(isPasswordWithNumber ? .green : . gray)
                Text("Un numero")
              }
            }
          }
        }
        //Login button
        VStack{
          Button(action: {
            //Calls the VM and execute createUser method
            Task{
              
            }
          }, label: {
            Text("Sign up")
              .modifier(RoundedBotton(color: .electricBlue, letterColor: .electricBlue))
          })
          .opacity(isPasswordIsValid ? 1 : 0.6)
          .disabled(!isPasswordIsValid)
          Button(action: {
            
          }, label: {
            HStack{
              Text("Already have an account?")
              Text("Sign up")
                .foregroundColor(.electricBlue)
                .fontWeight(.semibold)
            }
            .foregroundColor(.black)
            .font(.footnote)
          })
          
          
          NavigationLink {
            ///Agregar quickStart
          } label: {
            Text("Quick start")
              .modifier(RoundedBotton(color: .electricBlue, letterColor: .white))
          }
          
        }
      }
    }
  }
}


#Preview {
  RegistrationView(email: "", password: "")
}

