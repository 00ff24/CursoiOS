//
//  MenuView.swift
//  CursoiOS
//
//  Created by Cristian Garcia on 24/6/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination:MainIMCView()){
                    Text("IMC APP").foregroundColor(.white).bold()
                }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color("backgroundApp"))
                NavigationLink(destination: {}){
                    Text("DRUGSTORE APP").foregroundColor(.white).bold()
                }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color("backgroundApp"))
                NavigationLink(destination: {}){
                    Text("FARM APP").foregroundColor(.white).bold()
                }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color("backgroundApp"))
            }
        }
    }
}
 
struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
} 
