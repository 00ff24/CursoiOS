//  Created by Cristian Garcia on 29/6/24.

import SwiftUI

struct ResultIMCView: View {
    let userWeight:Double
    let userHeight:Double
    
    //aqui añado un parametro mas para poder traerme el genero seleccionado desde la vista anterior
    let userGender:Int
    
    var body: some View {
        VStack {
            Spacer()
            Text("YOUR RESULT IS")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.white)
            //hace el calculo en la funcion calculateIMC y la almacena en result y ese valor
            //Se lo paso como parametro a la vista ResultInformation
            let result = calculateIMC(weight: userWeight, height: userHeight)
            //le paso el parametro gender que me traigo de vista anterior
            ResultInformation(result: result, userGender: userGender)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(.backgroundApp)
    }
}

func calculateIMC(weight:Double, height:Double) -> Double {
    let result = weight/((height/100)*(height/100))
    return result
}



struct ResultInformation: View {
    let result:Double
    //Me traigo el gender como parametro para poder pasarselo en la otra funcion
    //getIMCResult
    let userGender:Int
    
    var body: some View {
        //utilizo la funcoin getIMCResult para hacer el calculo del switch
        //a esta funcion le paso como parametro el result que viene desde la primera vista
        let information = getImcResult(result: result, gender: userGender)
        
        VStack {
            Spacer()
            
            Image(information.3)
                .resizable().scaledToFit().frame(width: 128, height: 128)
            Text(information.0)
                .foregroundStyle(information.2).font(.title).bold()
            Spacer()
            Text("\(result, specifier: "%.2f")") //especifier se utiliza para especificar cuantos decimales quiero mostrar
                .font(.system(size: 80)).bold().foregroundStyle(.white)
            Spacer()
            Text(information.1)
                .foregroundStyle(.white).font(.title2).padding(.horizontal, 8)
            Spacer()
        }
        .frame(maxWidth: .infinity,maxHeight:.infinity)
        .background(.backgroundComponent)
        .cornerRadius(50)
        .padding(.top,20)
    }
}

//añado que voy a devolver un string mas
//ese string sera el nombre de la imagen que quiero mostrar
func getImcResult(result:Double, gender:Int) -> (String,String,Color,String) {
    let title:String
    let description:String
    let color:Color
    //me traigo por parametro el gender
    let gender:Int = gender
    let genderImageName:String
    
    switch result {
    case 0.00...19.99:
        title="PESO BAJO"
        description="Estás por debajo del peso recomendado por el IMC."
        color=Color.yellow
        
        if gender == 0 {
            genderImageName="pesobajomujer"
        }else { genderImageName="pesobajohombre" }
        
    case 20.00...24.99:
        title="PESO NORMAL"
        description="Estás en el peso recomendado por el IMC."
        color=Color.green
        
        if gender == 0 {
            genderImageName="pesonormalmujer"
        }else { genderImageName="pesonormalhombre" }
        
    case 25.00...29.99:
        title="SOBREPESO"
        description="Estás por encima del peso recomendado por el IMC."
        color=Color.orange
        
        if gender == 0 {
            genderImageName="sobrepesomujer"
        }else { genderImageName="sobrepesohombre" }
        
    case 30.00...99.99:
        title="OBESIDAD"
        description="Estás muy por encima del peso recomendado por el IMC."
        color=Color.red
        
        if gender == 0 {
            genderImageName="sobrepesomujer"
        }else { genderImageName="sobrepesohombre" }
        
    default:
        title="ERROR"
        description="HA OCURRIDO UN ERROR"
        color=Color.red
        
        if gender == 0 {
            genderImageName="error"
        }else { genderImageName="error" }
        
    }
    return(title,description,color,genderImageName)
}
