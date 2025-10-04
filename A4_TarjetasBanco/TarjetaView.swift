//
//  TarjetaView.swift
//  A4_TarjetasBanco
//
//  Created by win603 on 03/10/25.
//

import SwiftUI

struct TarjetaView: View {
    @State var pressed: Bool = false
    var color: Color = .red
    var banco: String = "Banamex"
    var logo: String = "bnmx"
    var numero: String = "1234 5678 9012 3456"
    var nombre: String = "Fabiola Juárez Flores"
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .frame(width: 350, height: 200)
            .foregroundStyle(color)
            .overlay{ //Sobre la figura
                
                VStack (alignment: .leading){
                    
                    //Título de banco y logo
                    HStack(){
                        Text(banco)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(Color.white)
                            .font(.system(size: 20, weight: .semibold))
                            .frame(height: 30)
                        Image(logo)
                            .resizable()
                            .padding(.trailing)
                            .frame(width: 50, height: 30)
                        Spacer()
                        Image("less02")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 30)
                    }.padding([.bottom, .top], 10)
                    
                    //Número de tarjeta
                    HStack{
                        Text(numero)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(Color.white)
                            .font(.system(size: 23))
                        Spacer()
                    }.padding(.bottom, 15)
                    
                    //Nombre del titular
                    HStack{
                        Text(nombre)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(Color.white)
                            .font(.system(size: 18))
                            .lineLimit(1)
                        Spacer()
                    }.padding(.bottom, 20)
                    
                    //Botón de candado Bloquear y logo
                    HStack{
                        Button(action: {
                            withAnimation(){
                                self.pressed.toggle()
                            }
                        }){
                            Image(systemName: "lock")
                                .foregroundStyle(Color.white)
                                .font(.system(size: 18, weight: .semibold))
                                .padding([.leading, .trailing], 10)
                        }
                        
                        Text("Bloquear")
                            .foregroundStyle(.white)
                        Spacer()
                        
                        Circle()
                            .fill(Color.orange)
                            .stroke(.white, lineWidth: 2)
                            .frame(width: 30, height: 30)
                            .overlay{
                                Circle()
                                    .fill(Color.blue)
                                    .stroke(.white, lineWidth: 2)
                                    .frame(width: 30, height: 30)
                                    .offset(x: -20, y: 0)
                            }
                    }
                }.padding()
                
            }.rotationEffect(pressed ? .degrees(180) : .degrees(0))
    }
}

#Preview {
    TarjetaView()
}
