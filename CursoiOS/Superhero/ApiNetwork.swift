import Foundation

class ApiNetwork{
    
    //la llamada a internet tiene que ser de manera asincrona
    //por eso le añadoel async y ademas con throws contemplo que esta
    //llamada puede fallar, me devuelve un objeto de tipo Wrapper
    func getHeroesByQuery(query:String) async throws -> Wrapper{
        let url = URL(string: "https://superheroapi.com/api/585e4e27e1b9708a4201035cf155c8f6/search/\(query)")!
        
        //En iOS ya tenemos un cliente que accede a internet y me trae la informacion (Consumir datos)
        //tengo que usarlo ya que es el por defecto "URL SESSION"
        //se le pasan dos valores por defecto, pero normalmente el segundo no se usa y se coloca un barra baja
        //Asi se le indica que no lo voy a usar
        //hay un error de que la url puede ser opcional, ya que puede no ser valida, pero
        //si estoy seguro que es valida, puedo ponerle un signo de exclamacion a la url = URL()!
        let (data, _) = try await URLSession.shared.data(from: url)
        
        //ahroa tengo todos los datos dentro de la variable data, y ahora uso JSON DECODER
        //decodifico con el modelo de datos Wrapper, le coloco .self para indicarle a swift que es el struc
        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
        
        //Ahora retorno el wrapper
        return wrapper
        
    }
    
    //tengo que crear mi modelo de datos de como llegaría el JSON para poder decodificarlo
    //Los nombres de los modelos de datos tienen que tener los mismos que el nombre de JSON
    //Para poder parsear el JSON tengo que decirle al modelo de datos que el CODABLE
    struct Wrapper:Codable {
        let response:String
        //aqui results recibe un array de datos del subnivel que cree con el struct Superhero
        let results: [Superhero]
    }
    
    //tengo que crear un struc por cada subnivel del JSON
    //Como solo estoy representando este modelo de datos
    //Solo añado aqui el protocolo identifiable
    //Si quiero representar el modelo wrapper tambien tengo que añadirle identifiable
    struct Superhero:Codable, Identifiable {
        let id:String
        let name:String
        let image:ImageSuperHero
    }
    
    struct ImageSuperHero:Codable {
        let url:String
    }
}


