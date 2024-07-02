//  Created by Cristian Garcia on 30/6/24.
//  @State esta directamente relacionado con @Binding

import SwiftUI

struct ViewComponents: View {
//        Se agrega un @State a la variable
//        por que los cambios que sufre esta, para poder
//        mostrarlos visualmente, se toman como estados
//        tengo que usar el @State si esos cambios se realizan en
//        la vista actual
    @State var viewCounter:Int = 0
    
    var body: some View {
        //Aqui le paso como parametro viewCounter
        //le paso con el $ delante para que la otra
        //Vista que lo reciba pueda modificar su valor
        //si no le paso con el dolar no puede modificarlo solo leerlo
        //$ --> indica o enlaza para que pueda leerse y  modificarse
        vistaContador(varContador: $viewCounter)
    }
}

struct vistaContador: View {
//    Se utiliza @Binding porque la vista
//    que se va encargar de pintar los cambios
//    de estados de la variable, no es esta misma vista
//    si fuera esta misma vista tendria que colocar @State
    @Binding var varContador:Int
    var body: some View {
        VStack{
            Text("\(varContador)").font(.largeTitle)
            Button("INCREMENTAR"){
                varContador = varContador + 1
                print(String(varContador))
            }
        }
    }
}

#Preview {
    ViewComponents()
}
