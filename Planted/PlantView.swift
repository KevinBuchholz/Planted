//
//  PlantView.swift
//  PlantsTest
//
//  Created by Kevin Buchholz on 3/28/23.
//

import SwiftUI

struct PlantView: View {
    @StateObject var plantModel = PlantModel()
    @State private var showingAlert = false

    
    var body: some View {

        NavigationStack{
            List(plantModel.plants) { plant in
                if plant.firstCommonName != "" {
                    NavigationLink(plant.firstCommonName, destination: PlantDetailView(plant: plant))
                }
            }
            .alert("Important Message", isPresented: $showingAlert){
                Button("OK", role: .cancel){
                }}
            .task {
                do{
                    try await self.plantModel.reload()
                }catch {
                    showingAlert = true
                }
            }
            .refreshable {
                do{
                    try await self.plantModel.reload()
                }catch {
                    showingAlert = true
                    
                }
            }
        
            .navigationTitle("Plants")
        }
        .padding()
        
    }
}

struct PlantView_Previews: PreviewProvider {
    static var previews: some View {
        PlantView()
    }
}
