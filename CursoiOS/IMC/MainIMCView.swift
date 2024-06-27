//
//  MainIMCView.swift
//  CursoiOS
//
//  Created by Cristian Garcia on 24/6/24.
//

import SwiftUI

struct MainIMCView: View {
    var body: some View {
        VStack{
            Text("ESTE ES MI COLOR DE BACKGROUNDAPP")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("backgroundApp"))
        }
        
    }




//VISTA DEL TOGGLE

struct ToggleButton: View {
    
    let text:String
    let imageName:String
    let index:Int
    
    var body: some View {
        Button(action: {})
        {
            VStack{
                Image(systemName: imageName)
                Text(text)
            }
            
        }
    }
}








//CÓDIGO QUE LLAMA A LA PREVIEW
struct MainIMCView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            //MainIMCView()
            ToggleButton(text: "Cristian", imageName:"heart.fill", index: 0)
        }
    }
}
