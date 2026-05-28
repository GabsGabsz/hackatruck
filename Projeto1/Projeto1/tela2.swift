//
//  tela2.swift
//  Projeto1
//
//  Created by Turma02-13 on 27/05/26.
//

import SwiftUI

struct tela2: View {
    var body: some View {
        HStack{
            Spacer()
            Image("imgcaminhao")
                .resizable()
                .scaledToFill()
                .frame(width: 150 , height: 150)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white,lineWidth: 4))
                .shadow(radius: 10)
            Spacer()
            VStack{
                Spacer()
                Text("HackaTruck")
                    .font(Font.headline.bold())
                    .foregroundColor(Color.red)
                Text("77 universidades")
                    .font(Font.headline.bold())
                    .foregroundColor(Color.blue)
                Text("5 regiões do Brasil")
                    .font(Font.headline.bold())
                    .foregroundColor(Color.orange)
                Spacer()
            }
            Spacer()
        }
        
    }
}

#Preview {
    tela2()
}
