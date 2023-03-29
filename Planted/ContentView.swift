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
                Image("PLNTD LOGO")
                    .resizable()
                    .padding()
                NavigationLink(destination: SuggestedView()){
                    Text("Suggested View")
                }
                .padding()
                NavigationLink(destination: UserPlantsView()){
                    Text("My Plants")
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
