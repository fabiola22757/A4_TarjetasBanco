//
//  TarjetaView.swift
//  A4_TarjetasBanco
//
//  Created by win603 on 03/10/25.
//

import SwiftUI

struct TarjetaView: View {
    //variables recibidas
    @Binding var isCardLocked: Bool
    var index: Int
    @Binding var selectedIndex: Int
    @Binding var selectedStarId: Int
    @State var showAlert : Bool = false
    
    var color: Color = .red
    var banco: String = "Banamex"
    var logo: String = "bnmx"
    var numero: String = "1234 5678 9012 3456"
    var nombre: String = "Fabiola Juárez Flores"
    
    //Función al dar clic
    func iconPressed() -> CGFloat{
        return isCardLocked ? 180 : 0
    }
     
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
                        //Ícono de favorito
                        Image(systemName: selectedStarId == index ? "star.fill" : "star")
                            .foregroundStyle(Color.white)
                            .onTapGesture{
                                withAnimation(){
                                    if selectedStarId == index{
                                        //Si ya estaba seleccionado, deseleccionar
                                        selectedStarId = -1
                                    }else{
                                        //Seleccionar esta estrellita
                                        selectedStarId = index
                                        showAlert = true //al pulsar la estrellita
                                    }
                                }
                            }.alert(isPresented: $showAlert) {
                                Alert(title: Text("Método de pago favorito"), message: Text("Tarjeta \(banco) ha sido establecida como método preferido de pago exitosamente"), dismissButton: .default(Text("OK")))
                            }
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
                                self.isCardLocked.toggle()
                            }
                        }){
                            Image(systemName: isCardLocked ? "lock" : "lock.open")
                                .foregroundStyle(Color.white)
                                .font(.system(size: 18, weight: .semibold))
                                .padding([.leading, .trailing], 10)
                        }
                        
                        Text(isCardLocked ? "Desbloquear" : "Bloquear")
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
                
            }.rotationEffect(.degrees(iconPressed()))
    }
}

#Preview {
    TarjetaView(isCardLocked: .constant(false), index: 0, selectedIndex: .constant(-1), selectedStarId: .constant(-1))
}
