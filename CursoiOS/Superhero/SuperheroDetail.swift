import SwiftUI
import SDWebImageSwiftUI
import Charts

struct SuperheroDetail: View {
    let id:String
    @State var superhero:ApiNetwork.SuperHeroCompleted? = nil
    @State var loading:Bool = true
    
    var body: some View {
                VStack{
                    if loading{
                        ProgressView().tint(.white)
                    }else if let superhero = superhero{
                        WebImage(url: URL(string: superhero.image.url)).resizable().scaledToFill().frame(height: 250).clipped()
        
                        Text(superhero.name).bold().font(.title).foregroundStyle(.white)
        
                        ForEach(superhero.biography.aliases, id:\.self){alias in Text(alias).foregroundStyle(.gray).italic()
            }
            
            SuperheroStats(stats: superhero.powerstats)
            
            Spacer()
            }
        }.frame(maxWidth: .infinity,maxHeight: .infinity).background(.backgroundApp)
            .onAppear{
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

struct SuperheroStats: View {
    let stats:ApiNetwork.Powerstats
    var body: some View {
        VStack{
            Chart{
                SectorMark(
                    angle: .value("Value", Int(stats.combat) ?? 0),
                            innerRadius: .ratio(0.5),
                            angularInset: 5
                        )
                        .cornerRadius(5)
                        .foregroundStyle(by: .value("Product category", "Combat"))
                SectorMark(
                    angle: .value("Value", Int(stats.durability) ?? 0),
                            innerRadius: .ratio(0.5),
                            angularInset: 5
                        )
                        .cornerRadius(5)
                        .foregroundStyle(by: .value("Product category", "Durability"))
                SectorMark(
                    angle: .value("Value", Int(stats.intelligence) ?? 0),
                            innerRadius: .ratio(0.5),
                            angularInset: 5
                        )
                        .cornerRadius(5)
                        .foregroundStyle(by: .value("Product category", "Intelligence"))
                SectorMark(
                    angle: .value("Value", Int(stats.power) ?? 0),
                            innerRadius: .ratio(0.5),
                            angularInset: 5
                        )
                        .cornerRadius(5)
                        .foregroundStyle(by: .value("Product category", "Powe"))
                SectorMark(
                    angle: .value("Value", Int(stats.speed) ?? 0),
                            innerRadius: .ratio(0.5),
                            angularInset: 5
                        )
                        .cornerRadius(5)
                        .foregroundStyle(by: .value("Product category", "Speed"))
                SectorMark(
                    angle: .value("Value", Int(stats.strength) ?? 0),
                    innerRadius: .ratio(0.5),
                            angularInset: 5
                        )
                        .cornerRadius(5)
                        .foregroundStyle(by: .value("Product category", "Strength"))
            }
        }.padding(10).frame(maxWidth: .infinity,maxHeight: 350).background(.white.opacity(0.85)).cornerRadius(16).padding()
    }
}
