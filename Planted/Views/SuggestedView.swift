//
//  SuggestedView.swift
//  Planted
//
//  Created by Kevin Buchholz on 3/29/23.
//

import SwiftUI

struct SuggestedView: View {
    @StateObject var videoStream = VideoStream()
    @StateObject var viewCounting = ViewCounting()
    @State var recorded : Double = 0.00
    @State var isRecorded = false
    @State var showList = false

    var body: some View {
        
        ZStack{
                LuxView()
                .navigationBarBackButtonHidden(true)
                .ignoresSafeArea()

            
//            VStack{
//                Spacer()
//                HStack(spacing: 20){
//                    NavigationLink(destination: ContentView()) {
//                        Text("Go back")
//                            .foregroundColor(.white)
//                            .bold()
//                            .frame(width: 90,height: 40)
//                            .background(.green)
//                            .cornerRadius(10)
//                    }
////                    .offset(x:-140)
//                    .navigationBarBackButtonHidden(true)
//                   
//                    Button{
//                        isRecorded.toggle()
//                        if isRecorded {
//                            recorded += videoStream.luminosityReading
//                        }
//                    }
//            label:{
//                Image(systemName: "camera.aperture")
////                    .resizable()
//                    .font(.title)
//                    
//            }
//                    
//                    Button{
//                        showList.toggle()
//                    }
//                label:{
//                    Text("Show List")
//                        .foregroundColor(.white)
//                        .bold()
//                        .frame(width: 90,height: 40)
//                        .background(.green)
//                        .cornerRadius(10)
//                }
//                    
//                    
//                }//hstack
//            }
        }

    }
}

struct SuggestedView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestedView()
    }
}
