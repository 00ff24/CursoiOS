//
//  SuperheroDetail.swift
//  CursoiOS
//
//  Created by Cristian Garcia on 15/7/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct SuperheroDetail: View {
    let id:String
    @State var superhero:ApiNetwork.SuperHeroCompleted? = nil
    @State var loading:Bool = true
    
    var body: some View {
        VStack{
            if loading{
                
            }else if let superhero = superhero{
                WebImage(url: URL(string: superhero.image.url))
                    .resizable().scaledToFill().frame(height: 250).clipped()
                Text(superhero.name).bold().font(.title).foregroundStyle(.white)
                ForEach(superhero.biography.aliases, id:\.self){
                    alias in Text(alias).foregroundStyle(.gray).italic()
                }
            }
            Spacer()
        }.frame(maxWidth: .infinity,maxHeight: .infinity).background(.backgroundApp).onAppear{
            Task{
                do{
                    superhero = try await ApiNetwork().getHeroById(id: id)
                }catch{
                    superhero = nil
                }
                loading = false
            }
        }
    }
}
