//
//  SuggestedView.swift
//  Planted
//
//  Created by Kevin Buchholz on 3/29/23.
//

import SwiftUI

struct SuggestedView: View {
    var body: some View {
        ZStack{
                LuxView()
                .navigationBarBackButtonHidden(true)
                .ignoresSafeArea()

            
            VStack{
                Spacer()
                NavigationLink(destination: ContentView()) {
                    Text("Go back")
                        .foregroundColor(.white)
                        .bold()
                        .frame(width: 90,height: 40)
                        .background(.green)
                        .cornerRadius(10)
                }
                .padding()
                .offset(x:-140)
                .navigationBarBackButtonHidden(true)

            }
        }

    }
}

struct SuggestedView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestedView()
    }
}
