//
//  PrincipalView.swift
//  DiWall
//
//  Created by Jairo Laurente Celis on 29/05/24.
//

import SwiftUI

struct PrincipalView: View {
    
    @StateObject var viewModel = DiWallCloneViewModel()
    let tabIcons = ["house","wallet.pass","plus","cart","person"]
    @State var indexSelectedIcons = 0
    
    var body: some View {
        NavigationStack {
            
                ZStack{
                    switch indexSelectedIcons {
                    case 0:
                        MenuView()
                            .environmentObject(viewModel)
                        case 1:
                        NavigationView{
                            Text("2")
                        }
                        .navigationTitle("Favoritos")
                        case 2:
                        NavigationView{
                            ExpensesSavingsView()
                                .environmentObject(viewModel)
                        }
                       // .navigationTitle("Carrito de Compras")
                       
                    default:
                        NavigationView{
                            Text("5")
                        }
                        .navigationTitle("Usuario")
                        }
                    }
                .ignoresSafeArea()
            Spacer()
                HStack{
                    ForEach(0..<5){ icon in
                        Spacer()
                        Button{
                            self.indexSelectedIcons = icon
                            
                        }label: {
                            
                            if indexSelectedIcons == icon{
                                Image(systemName: tabIcons[icon])
                                    .frame(width: 50,height: 50)
                                    .background(Color("BluePrincipal"))
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .clipShape(Circle())
                                    .shadow(radius: 10)
                                    .padding(.horizontal)
                            }else{
                                Image(systemName: tabIcons[icon])
                                    .font(.title)
                                    .padding(.horizontal)
                                    .foregroundColor(.black)
                            }
                        }
                      //  Spacer()
                    }
                }
                //.padding(.horizontal)
                
            
        }
    }
}

#Preview {
    PrincipalView()
        .environmentObject(DiWallCloneViewModel())
}
