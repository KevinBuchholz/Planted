//
//  ContentView.swift
//  Planted
//
//  Created by Kevin Buchholz on 3/27/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
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
                NavigationLink(destination: UserPlantsView()){
                    Text("My Plants")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(5)
                }

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


