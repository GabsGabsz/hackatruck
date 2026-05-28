//
//  tela3.swift
//  Projeto1
//
//  Created by Turma02-13 on 27/05/26.
//

import SwiftUI

struct tela3: View {
    @State var textoDigitado: String = "Lucas"
    
    @State var mostrarAlerta: Bool = false
    var body: some View {
        VStack{
            
            ZStack{
                
                Image("foto1")
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
                    .clipped()
                    .frame(width: 300, height: 300)
                    .padding()
                    .allowsHitTesting(false)
                
                VStack{
                    
                    Text("Bem-vindo, \(textoDigitado)")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color.blue)
                        .padding()
                    
                    
                    TextField("Seu nome:", text: $textoDigitado)
                        .textFieldStyle(.roundedBorder)
                        .background(Color.white.opacity(0.3))
                        .foregroundColor(.black)
                        .padding()
                        .zIndex(1)
                    
                    Spacer()
                    
                    Button(action: {
                        mostrarAlerta = true
                    }){
                        Text("Iniciar Desafio")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10.0)
                    }
                    .padding(.horizontal,20)
                    .padding(.bottom, 10)
                }
                .alert("Aviso", isPresented: $mostrarAlerta){
                    Button ("OK",role: .cancel){}
                }
                message : {
                    Text("Voce irá iniciar o desafio da aula agora")
                }
                
            }
        }
        .background {
            Image("imgcaminhao")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
                .opacity(0.1)
                .allowsHitTesting(false)
        }
    }
}

#Preview {
    tela3()
}
