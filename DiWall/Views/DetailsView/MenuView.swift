//
//  MenuView.swift
//  DiWall
//
//  Created by Jairo Laurente Celis on 29/05/24.
//


import SwiftUI

struct MenuView: View {
    @EnvironmentObject var viewModel:DiWallCloneViewModel
    @State var isActive = 0
    var body: some View {
        
        VStack {
            ZStack(alignment: .bottom){
                
                RectangleView()
                
                ZStack{
                    HStack{
                        SegmentedCard(title: "Ahorro", onPressed: {
                            isActive = 0
                        }, color: .green)
                        
                        Image(systemName: "arrowshape.left.arrowshape.right.fill")
                            .resizable()
                            .frame(width: 60,height: 25)
                            .foregroundColor(Color("BlueOpacity"))
                            .padding()
                        
                        SegmentedCard(title: "Gasto", onPressed: {
                            isActive = 1
                        }, color: .red)
                    }
                    .padding()
                    
                    
                }
            }
            if isActive == 0{
                List{
                    ForEach(viewModel.diWallSavings){ diwall in
                    HStack{
                       
                            Image(systemName: "dollarsign")
                                .foregroundColor(.green)
                                .bold()
                            Text("Descripción del ahorro")
                                .font(.headline)
                            Spacer()
                            
                        Text("$ \(diwall.savings,specifier: "%.2f")")
                                .foregroundColor(.green)
                                .bold()
                        }
                    }
                }
            }else{
                
                List{
                    ForEach(viewModel.diWallExpenses){ diwall in
                        HStack{
                            Image(systemName: "basket")
                                .foregroundColor(.green)
                                .bold()
                            Text("gasto")
                                .font(.headline)
                            Spacer()
                            Text("$ \(diwall.expense,specifier: "%.2f")")
                                .foregroundColor(.red)
                                .bold()
                        }
                    }
                }
            }
        }
    }
}
#Preview {
    MenuView()
        .environmentObject(DiWallCloneViewModel())
}
