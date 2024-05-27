//
//  DashboardView.swift
//  DiWall
//
//  Created by Laura Belen Yachelini on 22/05/2024.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Comida: $200")
                Text("TRansporte: $50")
                Text("Entretenimiento: $100")
                // Agrega más categorías y gastos aquí
            }
            .navigationBarTitle("Dashboard")
        }
    }
}

#Preview {
    DashboardView()
}
