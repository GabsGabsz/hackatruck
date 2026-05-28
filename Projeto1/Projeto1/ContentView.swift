//
//  ContentView.swift
//  Projeto1
//
//  Created by Turma02-13 on 27/05/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            HStack{
            quadradoVermelho
                Spacer()
                quadradoBlue
            }
          Spacer()
            HStack{
                quadradoVerde
                Spacer()
                quadradoYellow
            }
            
        }
     
    }
}
var quadradoVermelho: some View {
    Rectangle()
        .fill(Color.red)
        .frame(width: 70, height: 70)
        .padding()
}
var quadradoVerde: some View {
    Rectangle()
        .fill(Color.green)
        .frame(width: 70, height: 70)
        .padding()
}
var quadradoBlue: some View {
    Rectangle()
        .fill(Color.blue)
        .frame(width: 70, height: 70)
        .padding()
}
var quadradoYellow: some View {
    Rectangle()
        .fill(Color.yellow)
        .frame(width: 70, height: 70)
        .padding()
}

#Preview {
    ContentView()
}
