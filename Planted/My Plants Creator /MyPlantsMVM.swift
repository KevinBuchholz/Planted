//
//  MyPlantsCreator.swift
//  Planted
//
//  Created by Jacquese Whitson  on 3/31/23.
//

import Foundation
// setup
struct MyPlants : Identifiable {
var id = UUID()
    var commonNames: [String]
    let latinName: String
    var imageUrl: [String]
    var secureImageUrl = String()
    var lightIdeal : LightSabers? = nil
}


// View Model
class MyPlantsViewModel : ObservableObject {
    @Published private(set) var myPlants: [MyPlants]
    @Published var showingDetails: Bool = false
    init(){
        let myPlants = PlantsDataService.myPlantList
        self.myPlants = myPlants
    }
}



// pre Data
class PlantsDataService{
    static var myPlantList:[MyPlants] = [
        MyPlants(commonNames: ["Aeonium","Tree Houseleeks"],
                 latinName: "Aeonium spp.",
                 imageUrl: ["hl1","hl2","hl3"]),
        
        MyPlants(commonNames: ["Fairy duster","False mesquite"], latinName: "Calliandra, eriophylla", imageUrl: ["fd1","fd2","fd3"
                                                                                                                ]),
        
        MyPlants(commonNames: ["Arctic poppy","Iceland poppy"], latinName: "    Papaver nudicaule", imageUrl: ["ip1","ip2","ip3"
                                                                                                              ]),
        MyPlants(commonNames: ["San Marzano Tomato"],
                 latinName: "San Marzano",
                 imageUrl: ["tm1","tm2","tm3"])
    ]
}
