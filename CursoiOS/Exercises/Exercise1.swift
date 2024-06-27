//
//  ContentView.swift
//  CursoiOS
//
//  Created by Cristian Garcia on 23/6/24.
//

import SwiftUI

struct Exercise1: View {
    var body: some View {
        ZStack{
            Rectangle().foregroundColor(.red)
            VStack{
                HStack{
                    Rectangle().foregroundColor(.blue)
                    Rectangle().foregroundColor(.orange)
                    Rectangle().foregroundColor(.yellow)
                }
                Rectangle().foregroundColor(.orange)
                HStack {
                    Circle().foregroundColor(.green)
                    Rectangle().foregroundColor(.black).frame(height: 300)
                    Circle().foregroundColor(.indigo)
                }
                Rectangle().foregroundColor(.orange)
                HStack{
                    Rectangle().foregroundColor(.blue)
                    Rectangle().foregroundColor(.orange)
                    Rectangle().foregroundColor(.yellow)
                }
            }
        }.padding(.vertical)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Exercise1()
    }
}
