//
//  PlantDetailView.swift
//  Planted
//
//  Created by Kevin Buchholz on 3/29/23.
//

import SwiftUI

struct PlantDetailView: View {
    let plant: Plant
    var body: some View {
        NavigationStack{
            VStack{
                AsyncImage(url: URL(string: plant.secureImageUrl)!) { image in
                          image
                              .resizable()
                              .aspectRatio(contentMode: .fill)
                      } placeholder: {
                          Image(systemName: "photo.fill")
                      }.frame(width: 250, height: 250)
                    .padding()
                Text("Plant Name: \(plant.firstCommonName)")
                Text("\(plant.latinName)")
                    .padding()
            }
        }
    }
}

struct PlantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetailView(plant: Plant())
    }
}
