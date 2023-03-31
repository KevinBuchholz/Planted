//
//  ContentView.swift
//  Planted
//
//  Created by Kevin Buchholz on 3/27/23.
//

import SwiftUI

    // MP Stands for MyPlant(plants i own)


struct ContentView: View {
    var body: some View {
//        @EnvironmentObject private var vm : LocationsViewModel
      
        NavigationStack{
            VStack{
                Image("PlantedLogo2")
                .resizable()
                .scaledToFit()
                .padding(40)
               
                NavigationLink(destination: SuggestedView()) {  Text("Suggest A Plant")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .foregroundColor(.green)
         }
            NavigationLink(destination: MpCard(myPlants:PlantsDataService.myPlantList.first!)){
                    Text("My Plants")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(5)
                }
//                .navigationBarBackButtonHidden(true)
//
                .foregroundColor(.green)
            
            }
                        .offset(x:0, y: -150)
        }
    }

    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
            
        }
    }


