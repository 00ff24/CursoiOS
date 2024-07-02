//  Created by Cristian Garcia on 24/6/24.

import SwiftUI

struct MainIMCView: View {
    //init() {UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]}
    @State var age:Int = 25
    @State var gender:Int = 0
    @State var height:Double = 150
    @State var weight:Int = 60
    
    var body: some View {
            VStack{
                        HStack {
                            //togglebutton espera que le pase 4 parametros las 3 variablas + el binding
                            //3 de los parametros los paso directametne, y el selectedgender le paso la
                            //con un $gender para que pueda ser modificado por la otra vista.
                            ToggleButton(text: "WOMAN", imageName: "heart.fill", gender: 0, selectedGender: $gender)
                            ToggleButton(text: "MAN", imageName: "star.fill", gender: 1, selectedGender: $gender)
                        }
                                
                        HeightCalculator(selectedHeight: $height)
                        
                        HStack{
                            CounterButton(text: "AGE", number: $age)
                            CounterButton(text: "WEIGHT", number: $weight)
                        }
                        //añadi el parametro gender, se lo paso directament sin $ porque no lo voy a modificar
                        CalculateButton(userWeight: Double(weight), userHeight: height, userGender: gender)
                
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.backgroundApp)
                    .toolbar{
                        ToolbarItem(placement: .principal){
                            Text("IMC CALCULATOR").bold().foregroundColor(.white)
                        }
                    }
                    .toolbarBackground(.backgroundApp, for: .navigationBar)
                    .toolbarBackground(.visible, for: .navigationBar)
                    //.navigationTitle("IMC CALCULATOR")
                    // esta linea es para el toolbar,
                    // se tiene que colocar junto con la linea de arriba que pone init()
    }
}

struct ToggleButton:View {
    //estas variables son los parametros que le tengo que pasar cuando hago la llamada
    //al binding le paso el @state de la vista donde lo voy a pintar
    let text:String
    let imageName:String
    let gender:Int
    @Binding var selectedGender:Int
    
     var body: some View {
         
         let color = if( gender == selectedGender ){
             Color.backgroundComponentSelected
         }
         else{ Color.backgroundComponent }
         
         Button(action: { selectedGender=gender })
         {
             VStack{
                 Image(systemName: imageName).resizable().scaledToFit().frame(height:100).foregroundColor(.white)
                 InformationText(text: text)
             }.frame(maxWidth: .infinity, maxHeight: .infinity)
              .background(color)
         }
    }
}

struct InformationText:View {
    let text:String
    var body: some View {
        Text(text).font(.largeTitle).bold().foregroundColor(.white)
    }
}

struct TitleText: View {
    let text:String
    var body: some View {
        Text(text).font(.title2).foregroundColor(.gray)
    }
}

struct HeightCalculator: View {
    @Binding var selectedHeight:Double
    var body: some View {
        VStack{
            TitleText(text:"HEIGHT")
            InformationText(text: "\(Int(selectedHeight)) cm")
            Slider(value: $selectedHeight, in: 100...220, step: 1).accentColor(.purple).padding(.horizontal, 16)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundComponent)
    }
}

struct CounterButton: View {
    let text:String
    @Binding var number:Int
    var body: some View {
        VStack {
            TitleText(text: text)
            //Si coloco el simbolo dolar ($) delante de la variable es porque voy a trabajar con esa variable y la quiero modificar, si no la coloco es porque solo la voy a mostrar
            InformationText(text: String(number))
            HStack {
                //boton para sumar
                Button(action:{
                    if number >= 120 {
                        print("Tas goooordo perro")
                    }else{
                        number += 1
                    }
                }){
                    ZStack{
                        Circle().frame(width: 70, height: 70)
                        Image(systemName: "plus").resizable().scaledToFit().foregroundColor(.white).frame(width: 25,height: 25)
                    }
                }
                //boton para restar
                Button(action:{
                    if number <= 0 {
                        print("NO SE PUEDE TENER UN NUMERO NEGATIVO")
                    }else{
                        number -= 1
                    }
                }){
                    ZStack{
                        Circle().frame(width: 70, height: 70).foregroundColor(.purple)
                        Image(systemName: "minus").resizable().scaledToFit().foregroundColor(.white).frame(width: 25,height: 25)
                    }
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundComponent)
    }
}

struct CalculateButton: View {
    let userWeight:Double
    let userHeight:Double
    //Aqui tengo el parametro de genero para enviarselo a la siguiente vista
    //ResultIMCView
    let userGender:Int
    
    var body: some View {
        NavigationStack {
            NavigationLink(destination: ResultIMCView(userWeight: userWeight, userHeight: userHeight, userGender: userGender)) {
                Text("Calculate")
                    .font(.title)
                    .bold()
                    .foregroundColor(.purple)
                    .frame(maxWidth: .infinity, maxHeight: 100).background(.backgroundComponent)
            }
        }
    }
}
