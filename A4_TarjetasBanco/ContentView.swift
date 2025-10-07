//
//  ContentView.swift
//  A4_TarjetasBanco
//
//  Created by win603 on 26/09/25.
//

import SwiftUI

struct ContentView: View {
    //variables
    @State var cardSelected: Int = -1
    @State var isCardLockedPadre: Bool = false
    @State var starSelected: Int = -1
    
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
                TarjetaView(isCardLocked: $isCardLockedPadre, index: 0, selectedIndex: $cardSelected)
                TarjetaView(isCardLocked: $isCardLockedPadre, index: 1, selectedIndex: $cardSelected, color: .blue, banco: "Mercado Pago", logo: "mp")
                TarjetaView(isCardLocked: $isCardLockedPadre, index: 3, selectedIndex: $cardSelected, color: .purple, banco: "NU", logo: "nu")
            }
        }
    }
}

#Preview {
    ContentView()
}
