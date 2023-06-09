//
//  LuxReference.swift
//  Planted
//
//  Created by Jacquese Whitson  on 3/30/23.
//

import Foundation
import Foundation
import SwiftUI
import StoreKit

struct LuxReference: Identifiable {
    let reference: String
    let value: String
    let id = UUID()
}

// if recorded is  > 21500 retrun full sun
//if recorded is <= 21,500 ||recorded is >= 3,200 return strongllight

enum LightSabers{
    case fullSun
    //recorded > 21,500

    case strongLight
    // 21,500... 3,200
//    case diffuseLight 
    // less than 5300
}





let references = [
    LuxReference(reference: "Overcast night sky without moon", value: "0.0001"),
    LuxReference(reference: "Full moon on a clear night", value: "0.3"),
    LuxReference(reference: "Horizon at dusk with a clear sky", value: "3.4"),
    LuxReference(reference: "Family living room lights (1998)", value: "50"),
    LuxReference(reference: "Public restroom", value: "80"),
    LuxReference(reference: "Very dark overcast day", value: "100"),
    LuxReference(reference: "Train station platform", value: "150"),
    LuxReference(reference: "Sunrise or sunset on a clear day", value: "400"),
    LuxReference(reference: "Office lighting", value: "500"),
    LuxReference(reference: "Overcast day", value: "1000"),
    LuxReference(reference: "Full daylight", value: "10,000 - 25,000"),
    LuxReference(reference: "Direct sunlight", value: "32,000 - 100,000")
]

struct ReferenceView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.requestReview) private var requestReview
    
    var body: some View {
        
        if horizontalSizeClass == .compact{
            HStack {
                List(references) {
                    Text(String("\($0.reference):\t \($0.value) Lux"))
                }
            }
        } else {
            Table(references) {
                TableColumn("Reference", value: \.reference)
                TableColumn("Value", value: \.value)
            }
        }
    }
}
