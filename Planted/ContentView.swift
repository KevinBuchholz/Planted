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
                .offset(x:0, y: -150)
               
                NavigationLink(destination: SuggestedView()) {  Text("Suggest A Plant")
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.roundedRectangle(radius: 5))
                .foregroundColor(.white)
                .background(CustomColor.LightGreen)
         }
                NavigationLink(destination: UserPlantsView()){
                    Text("My Plants")
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.roundedRectangle(radius: 5))
                .foregroundColor(.white)
                .background(CustomColor.LightGreen)
                .padding()
            }                .navigationBarBackButtonHidden(true)

        }
    }

    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }


