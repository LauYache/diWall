//
//  RectangleView.swift
//  DiWall
//
//  Created by Jairo Laurente Celis on 29/05/24.
//

import SwiftUI

struct RectangleView: View {
    var body: some View {
        ZStack(alignment: .top){
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 400)
                .foregroundColor(Color("BluePrincipal"))
                .cornerRadius(25)
            
            ZStack{
                VStack{
                    HStack{
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                        
                        Text("Hola, Jairo")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Image(systemName: "list.bullet.rectangle")
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                    .padding()
                    
                    Text("$ 56,289")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                        .padding(.bottom,80)
                }
                .padding(.top, 50)
            }
        }
            
       
    }
}

#Preview {
    RectangleView()
}
