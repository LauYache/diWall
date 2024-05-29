//
//  DetailWallet.swift
//  DiWall
//
//  Created by Jairo Laurente Celis on 29/05/24.
//

import SwiftUI

struct DetailWallet: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: DiWallCloneViewModel
   // @State var diWall: DiWallModel
    
    @State var money = ""
    
    @State var typeWallet = "Ahorrar"
    let types = ["Ahorrar", "Gastar"]
    
    @State var expense = "Hogar"
    let expenses = ["Netflix", "Amazon","Mercado", "Ropa","Hogar"]
    
    var body: some View {
        
        NavigationStack{
        Form{
            
            Picker("Billetera a elegir", selection: $typeWallet) {
                ForEach(types, id: \.self){
                    Text($0)
                }
            }
            
            Section("Dinero a \(typeWallet)"){
                TextField("Cuanto dinero vas a \(typeWallet)", text: $money)
                    .keyboardType(.decimalPad)
            }
            
            if typeWallet == "Gastar"{
                Section("Elija su tipo de Gasto"){
                    Picker("", selection: $expense) {
                        ForEach(expenses,id: \.self){
                            Text($0)
                        }
                    }
                    .labelsHidden()
                    .pickerStyle(.inline)
                    .padding()
                    .background(Color("OrangePrincipal"))
                }
                
            }
        }
        .toolbar{
            ToolbarItem{
                Button("Save"){
                    if typeWallet == "Ahorrar"{
                        viewModel.addSavings(savings: Double(money) ?? 0.0)
                    }else{
                        viewModel.addExpenses(expenses: Double(money) ?? 0.0)
                    }
                   
                    dismiss()
                }
            }
            ToolbarItem(placement: .topBarLeading){
                Button("Cancelar"){
                    dismiss()
                }
            }
            
        }
    }
        
    }
}

#Preview {
    NavigationStack{
        DetailWallet()
            .environmentObject(DiWallCloneViewModel())
    }
}
