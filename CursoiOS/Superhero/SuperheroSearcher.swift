import SwiftUI
import SDWebImageSwiftUI

struct SuperheroSearcher: View {
    @State var superheroName:String = ""
    //en vez de usar response para pintar el json que esta decodificando uso un state
    @State var wrapper:ApiNetwork.Wrapper? = nil //con el ? le digo que puede ser nil
    @State var loading:Bool = false
    var body: some View {
        VStack{
            TextField("",
                      text: $superheroName,
                      prompt: Text("Buscar super heroe...").font(.title2).bold().foregroundColor(.gray)
            )
            .font(.title2)
            .bold()
            .foregroundStyle(.white)
            .padding(16)
            .border(.purple, width: 2)
            .padding(8)
            .autocorrectionDisabled()
            .onSubmit {
                //print(superheroName)
                //No puedo lanzar un proceso asincrono directamente
                //Ya que no se cuando va a acabar ese proceso, y las lineas
                //de codigo tienen que continuar, entonces necesito usar un Task
                loading = true
                Task{
                    do{
//                        let response = try await ApiNetwork().getHeroesByQuery(query: superheroName)
//                        print(response)
                        wrapper = try await ApiNetwork().getHeroesByQuery(query: superheroName)

                    }catch{
                        print("error")
                    }
                    loading = false
                }
            }
            
            if loading{
                ProgressView().tint(.white)
            }
            
            NavigationStack{
                List(wrapper?.results ?? []){
                    superhero in //Text(superhero.name)
                    //Aqui puedo cambiar que en lugar de mostrar el nombre llame a una vista
                    //para eso personalizo una vista llamada struct superheroitem
                    ZStack{
                        SuperHeroItem(superhero: superhero)
                        NavigationLink(destination: {SuperheroDetail(id: superhero.id)}){EmptyView()}.opacity(0)
                    }.listRowBackground(Color.backgroundApp)
                }.listStyle(.plain)
            }
            Spacer()
        }.frame(maxWidth: .infinity,maxHeight: .infinity).background(.backgroundApp)
        
    }
}

struct SuperHeroItem: View {
    let superhero:ApiNetwork.Superhero
    var body: some View {
        ZStack{
            //superhero.image.url
            WebImage(url: URL(string: superhero.image.url))
                .resizable()
                .indicator(.activity)
                .scaledToFill()
                .frame(height: 200)
            VStack{
                Spacer()
                Text(superhero.name).foregroundStyle(.white)
                    .font(.title)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.white.opacity(0.5))
            }
        }.frame(height: 200).cornerRadius(32)
    }
}

//Para consumir imagenes desde una url utilizo la libreria de terceros
//SDWebImageSwiftUI
//Probar con la solucion nativa de xcode image async

