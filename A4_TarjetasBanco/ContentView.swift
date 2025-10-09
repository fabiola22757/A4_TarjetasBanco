//
//  ContentView.swift
//  A4_TarjetasBanco
//
//  Created by win603 on 26/09/25.
//

import SwiftUI

struct ContentView: View {
    //variables
    @State var isCardLockedPadre: Bool = false
    @State var cardSelected: Int = -1
    @State var starSelected: Int = -1 // <-- Estado para estrella seleccionada globalmente
    
    var body: some View {
        //GroupBox isCardLockedPadre
        HStack{
            GroupBox(label: Label(isCardLockedPadre ? "Tarjetas congeladas" : "", systemImage: isCardLockedPadre ? "lock.badge.clock.fill" : "")) {
                Text(isCardLockedPadre ? "Todas tus tarjetas están temporalmente desactivadas por seguridad." : "")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.top, 4)
            }
            .padding()
        }
        
        ScrollView(.vertical, showsIndicators: true){
            VStack(spacing:-10){
                TarjetaView(isCardLocked: $isCardLockedPadre, index: 0, selectedIndex: $cardSelected, selectedStarId: $starSelected)
                TarjetaView(isCardLocked: $isCardLockedPadre, index: 1, selectedIndex: $cardSelected, selectedStarId: $starSelected, color: .blue, banco: "Mercado Pago", logo: "mp")
                TarjetaView(isCardLocked: $isCardLockedPadre, index: 3, selectedIndex: $cardSelected, selectedStarId: $starSelected, color: .purple, banco: "NU", logo: "nu")
            }
        }
    }
}

#Preview {
    ContentView()
}
