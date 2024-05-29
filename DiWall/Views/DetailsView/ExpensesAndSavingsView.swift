//
//  ExpensesAndSavingsView.swift
//  DiWall
//
//  Created by Jairo Laurente Celis on 29/05/24.
//

import SwiftUI

struct ExpensesSavingsView: View {
    
    @EnvironmentObject var viewModel: DiWallCloneViewModel
   // var diWall: DiWallModel
    @State private var isActive = false
    var body: some View {
        
      
            NavigationStack {
                VStack{
                    if !viewModel.diWallSavings.isEmpty{
                        List{
                            Section("Ahorro"){
                                ForEach(viewModel.diWallSavings){ diwall in
                                    HStack{
                                        Image(systemName: "dollarsign.circle")
                                            .foregroundColor(.green)
                                        
                                        Text("\(diwall.savings, specifier: "%.2f")")
                                    }
                                }
                            }
                        }
                        .padding()
                        //   .frame(height: 200)
                    }else{
                        HStack{
                            Image("creditCard")
                                .resizable()
                                .frame(width: 40,height: 40)
                            
                            Text("Tu Cartera de Ahorro aún está vacía")
                                
                        }
                        .padding(.top,150)
                        
                    }
                    Spacer()
                    Divider()
                    Spacer()
                    if !viewModel.diWallExpenses.isEmpty{
                        List{
                            Section("Gasto"){
                                ForEach(viewModel.diWallExpenses){ diwall in
                                    HStack{
                                        Image(systemName: "dollarsign.circle")
                                            .foregroundColor(.red)
                                        
                                        Text("\(diwall.expense,specifier: "%.2f")")
                                    }
                                }
                            }
                        }
                        .padding()
                    
                    }else{
                        HStack{
                            Image("creditCard")
                                .resizable()
                                .frame(width: 40,height: 40)
                            
                            Text("Tu Cartera de Gasto aún está vacía")
                        }
                        .padding(.bottom,200)
                    }
                    
                }
                .navigationTitle("Wallet")
        }
            .toolbar{
                Button{
                    isActive.toggle()
                    
                }label: {
                    Image(systemName: "plus")
                        .foregroundColor(Color("OrangePrincipal"))
                        .bold()
                    
                }
            }
            .sheet(isPresented: $isActive) {
                DetailWallet()
        }
        }
    }


#Preview {
   // NavigationStack{
    ExpensesSavingsView()
            .environmentObject(DiWallCloneViewModel())
  //  }
}
