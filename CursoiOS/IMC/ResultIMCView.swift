//  Created by Cristian Garcia on 29/6/24.

import SwiftUI

struct ResultIMCView: View {
    let userWeight:Double
    let userHeight:Double
    
    var body: some View {
        VStack {
            Spacer()
            Text("YOUR RESULT IS")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.white)
            let result = calculateIMC(weight: userWeight, height: userHeight)
            ResultInformation(result: result)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(.backgroundApp)
    }
}

func calculateIMC(weight:Double, height:Double) -> Double {
    let result = weight/((height/100)*(height/100))
    return result
}

func getImcResult(result:Double) -> (String,String,Color) {
    let title:String
    let description:String
    let color:Color
    switch result {
    case 0.00...19.99:
        title="PESO BAJO"
        description="Estás por debajo del peso recomendado por el IMC."
        color=Color.yellow
    case 20.00...24.99:
        title="PESO NORMAL"
        description="Estás en el peso recomendado por el IMC."
        color=Color.green
    case 25.00...29.99:
        title="SOBREPESO"
        description="Estás por encima del peso recomendado por el IMC."
        color=Color.orange
    case 30.00...99.99:
        title="OBESIDAD"
        description="Estás muy por encima del peso recomendado por el IMC."
        color=Color.red
    default:
        title="ERROR"
        description="HA OCURRIDO UN ERROR"
        color=Color.red
    }
    return(title,description,color)
}

struct ResultInformation: View {
    let result:Double
    var body: some View {
        let information = getImcResult(result: result)
        VStack {
            Spacer()
            Image("imc")
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

