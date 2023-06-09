//
//  PlantModel.swift
//  PlantsTest
//
//  Created by Kevin Buchholz on 3/28/23.
//

import Foundation


struct Plant : Identifiable, Decodable {
    // let Common name (fr.) = commonName
    
    enum CodingKeys: String, CodingKey {
        case id
        case commonNames = "Common name"
        case latinName = "Latin name"
        case imageUrl = "Img"
        case lightIdeal = "Light ideal"
        case lightTolerated = "Light tolerated"
        case watering = "Watering"
    }
    
    let id: String
    var commonNames: [String]? = nil
    var firstCommonName: String {
        guard let names = commonNames else {
            return ""
        }
        return names[0].capitalized
    }
        var latinName: String
  //  let lightTolerated: String
        var imageUrl: String
    var secureImageUrl = String()
    //    var tempMax : String
    //    var tempMin : String
        var lightIdeal : LightSabers? = nil
        var lightTolerated : String
        var watering : String
    //    var use: String
    
    
    
    
    /// getting Api data
    init(from decoder: Decoder) throws {
        let plant = try! decoder.container(keyedBy: CodingKeys.self)
        id = try! plant.decode(String.self, forKey: .id)
        commonNames = try! plant.decode([String]?.self, forKey: .commonNames)
        latinName = try! plant.decode(String.self, forKey: .latinName)
        imageUrl = try! plant.decode(String.self, forKey: .imageUrl)
        lightTolerated = try! plant.decode(String.self, forKey: .lightIdeal)
        watering = try! plant.decode(String.self, forKey: .watering)
        let index = imageUrl.firstIndex(of: ":")!
        var url = imageUrl
        url.insert("s", at: index)
        secureImageUrl = url
        let lightIdealString = try! plant.decode(String.self, forKey: .lightIdeal)
        if lightIdealString.lowercased().localizedStandardContains("strong") {
            lightIdeal = .strongLight
        } else if lightIdealString.lowercased().localizedStandardContains("full") {
            lightIdeal = .fullSun
        } else {
            fatalError("didnt ccontain strong or full light")
        }
    }
    
    init() {
        self.id = "0"
        self.latinName = ""
        self.imageUrl = ""
        self.lightTolerated = ""
        self.watering = ""
    }
    
}

class PlantModel : ObservableObject {
    @Published var plants : [Plant] = []
    @Published var plant: Plant = Plant()
    //    let url = URL(string: "https://house-plants2.p.rapidapi.com/all")!
    let url = URL(string: "https://rapidapi.com")!
    
    func reload() async throws {
        let headers = [
            "X-RapidAPI-Key": Secret.apiKey,
            "X-RapidAPI-Host": "house-plants2.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://house-plants2.p.rapidapi.com/all")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let(data, _) = try! await session.data(from: url)
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
//                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                
                DispatchQueue.main.async {
                    self.plants = try! JSONDecoder().decode([Plant].self, from: data!)
                }
            }
        })
        
        dataTask.resume()
    }
    
    
    
}


