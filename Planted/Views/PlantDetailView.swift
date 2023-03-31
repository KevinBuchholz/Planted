//
//  PlantDetailView.swift
//  Planted
//
//  Created by Kevin Buchholz on 3/29/23.
//

import SwiftUI

struct PlantDetailView: View {
    let plant: Plant
    @StateObject var plantModel = PlantModel()

    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    AsyncImage(url: URL(string: plant.secureImageUrl)!) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(20)
                    } placeholder: {
                        Image(systemName: "photo.fill")
                    }.frame(width: 250, height: 250)
                        .padding()
                    VStack(spacing:1){
                        Text("Names")
                            .font(.title2)
                            .fontWeight (.black)
                            .foregroundColor (.primary)
                            .frame (height: 55)
                            .frame(maxWidth: .infinity)
                        VStack{
                            HStack{
                                Text("Common Name:")
                                Text("\(plant.firstCommonName)")
                                    .bold()
                            }
                            HStack{
                                Text("Latin Name:")
                                Text("\(plant.latinName)")
                                    .bold()
                                    .foregroundColor(.orange)

                            }
                        }
                        
                    }
                    Divider()
                    VStack{
                        Text("Light Info")
                            .font(.title2)
                            .fontWeight (.black)
                            .foregroundColor (.primary)
                            .frame (height: 55)
                            .frame(maxWidth: .infinity)
                        Text("\(plant.lightTolerated)")
                        
                    }
                    Divider()
                    VStack{
                        
                        Text("Watering Info")
                            .font(.title2)
                            .fontWeight (.black)
                            .foregroundColor (.primary)
                            .frame (height: 55)
                            .frame(maxWidth: .infinity)
                        Text("\(plant.watering)")
                            .lineLimit(2)

                        
                    }
                    
                    
                    
                }
            }
           
        }
        .task {
            do{
                try await self.plantModel.reload()
            }catch {
//                    showingAlert = true
            }
        }
        .refreshable {
            do{
                try await self.plantModel.reload()
            }catch {
//                    showingAlert = true
                
            }
        }
    }
}

struct PlantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetailView(plant:Plant())
            .environmentObject(PlantModel())
    }
}
