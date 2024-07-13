import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink(destination: MainIMCView()){
                    Text("IMC").foregroundColor(.white).bold().font(.largeTitle)
                }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundApp)
                
                NavigationLink(destination: SuperheroSearcher()){
                    Text("SUPERHERO FINDER").foregroundColor(.white).bold().font(.largeTitle)
                }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundApp)
                
                NavigationLink(destination: {}){
                    Text("DRUGSTORE").foregroundColor(.white).bold().font(.largeTitle)
                }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundApp)
            }.background(.backgroundApp)
        }
    }
}
