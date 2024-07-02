//
//  MenuView.swift
//  CursoiOS
//
//  Created by Cristian Garcia on 24/6/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink(destination: MainIMCView()){
                    Text("IMC APP").foregroundColor(.white).bold().font(.largeTitle)
                }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundApp)
                
                NavigationLink(destination: {}){
                    Text("DRUGSTORE APP").foregroundColor(.white).bold().font(.largeTitle)
                }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundApp)
                
                NavigationLink(destination: {}){
                    Text("FARM APP").foregroundColor(.white).bold().font(.largeTitle)
                }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundApp)
            }.background(.backgroundApp)
        }
    }
}
