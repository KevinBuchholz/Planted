//
//  MyPlantsDetails.swift
//  Planted
//
//  Created by Jacquese Whitson  on 3/31/23.
//

import SwiftUI
// MP Stands for MyPlant(plants i own)

struct MpDetailCard: View {
    @EnvironmentObject private var vm : MyPlantsViewModel

    var body: some View {
        ScrollView {
            VStack{
                Text("Common Names")
                    .font(.title2)
                    .fontWeight (.black)
                    .foregroundColor (.primary)
                    .frame (height: 55)
                    .frame(maxWidth: .infinity)
                Divider()
                     
                Text("ok Names")

                Text("Light Details")
                    .font(.title2)
                    .fontWeight (.black)
                    .foregroundColor (.primary)
                    .frame (height: 55)
                    .frame(maxWidth: .infinity)
                Divider()
                
                
            }
        }
    }
}

struct MyPlantsDetails_Previews: PreviewProvider {
    static var previews: some View {
        MpDetailCard()
            .environmentObject(MyPlantsViewModel())

    }
}

extension MpDetailCard{
    
    private func details(plant: MyPlants) -> some View{
        VStack {
            HStack{
                if let imageName = plant.imageUrl.first{
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 45, height: 45)
                        .cornerRadius(10)
                }
                VStack(alignment: .leading){
                    Text(plant.latinName)
                        .font(.headline)
                    Text(plant.commonNames[0])
                        .font(.subheadline)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .padding()
            }
        
    }
}

