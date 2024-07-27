import SwiftUI

//Hay dos formas de representar las listas

//------------------#1 forma---------------------------
//Primero se tiene que crear una esctructura de los datos (Modelo de datos)
struct structPokemon {
    let name:String
}

//Aqui tendria mi array de pokemons
var arrayPokemons = [
    structPokemon(name: "Pikachu"),
    structPokemon(name: "Vulvasor"),
    structPokemon(name: "Charizar"),
    structPokemon(name: "Charmilion"),
    structPokemon(name: "Charmander"),
    structPokemon(name: "Squartel")
]
//------------------#1 forma---------------------------

//------------------#2 forma---------------------------
//Primero se tiene que crear una esctructura de los datos (Modelo de datos)
//Añado el protocolo identifable, y tambien añadir un valor que sea unico.

struct structDigimon:Identifiable {
    var id = UUID()
    let name:String
}

//Aqui tendria mi array de digimon
var arrayDigimons = [
    structDigimon(name: "Agumon"),
    structDigimon(name: "Graymon"),
    structDigimon(name: "Garurumon"),
    structDigimon(name: "Metalgraymon"),
    structDigimon(name: "Weregarurumon")
]
//------------------#2 forma---------------------------

struct listExample: View {
    var body: some View {
        
                //#1 forma de representar las listas
                List{
                    //tengo que añadir el id o el identificador de cada obejto dentro del array
                    //ese id tiene que ser unico, en este caso uso el name como identificador unico
                    ForEach(arrayPokemons, id:\.name) { x in
                        Text(x.name)
                    }
                }
        
                //#2 Forma de representar las listas añadiento el id directamente
                // en el modelo struct
                List{
                    ForEach(arrayDigimons) { digimon in
                        Text(digimon.name)
                    }
                }
        
                //Para ahorrarme el ForEach
                List(arrayDigimons) { j in
                    Text(j.name)
                }
        
        //Las listas puede tener sectiones
        List{
            Section {
                ForEach(arrayPokemons, id:\.name) { x in
                    Text(x.name)
                }
            } header: {
                Text("Lista de Pokemons")
            }
            
            Section {
                ForEach(arrayDigimons) { digimon in
                    Text(digimon.name)
                }
            } header: {
                Text("Lista de Digimons")
            }
            
            Section {
                Text("ELEMENTO DE LA LISTA")
            } footer: {
                Text("footer Section")
            }

        }.listStyle(.automatic)
        
        //Usando listas con navigationStack y navigationlink
        
        NavigationStack{
            List{
                NavigationLink {
                    ForEach(arrayPokemons, id:\.name) { x in
                        Text(x.name)
                    }
                } label: {
                    Text("Item list with NavigationLink")
                }
            }
        }
    }
}
