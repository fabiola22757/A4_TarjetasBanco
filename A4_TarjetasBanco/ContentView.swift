//
//  ContentView.swift
//  A4_TarjetasBanco
//
//  Created by win603 on 26/09/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true){
            VStack(spacing:-10){
                TarjetaView()
                TarjetaView(color: .blue, banco: "Mercado Pago", logo: "mp")
                TarjetaView(color: .purple, banco: "NU", logo: "nu")
            }
        }
    }
}

#Preview {
    ContentView()
}
