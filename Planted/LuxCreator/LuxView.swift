//
//  LuxView.swift
//  Planted
//
//  Created by Jacquese Whitson  on 3/30/23.
//

import SwiftUI


struct LuxView: View {
    @StateObject var videoStream = VideoStream()
    @StateObject var viewCounting = ViewCounting()
    @State var recorded : Double = 0.00
    @State var isRecorded = false

    @State var showList = false

    // Prompt user for review
    @Environment(\.requestReview) private var requestReview
    
    var body: some View {
        ZStack{
        if (!videoStream.cameraAccess) {
            Text("This app requires authorization to access your camera in order to work correctly. You may grant this access from your device settings menu.")
                .font(.title)
                .padding()
                .multilineTextAlignment(.center)
        } else {
            
            NavigationView {
                
                VStack {
                    if (videoStream.session != nil) {
                        VideoPreviewHolder(runningSession: videoStream.session)
                            .frame(minWidth: 0, idealWidth: .infinity, maxWidth: .infinity, minHeight: 0, idealHeight: .infinity, maxHeight: .infinity, alignment: .center)
                    } else {
                        ProgressView()
                    }
                    Text("\(recorded)")
                    Text(String(format: "%.0f  Lux", videoStream.luminosityReading))
                        .padding()
                        .font(.system(size: 50))
                    
                    VStack{
//                        Spacer()
                        HStack(spacing: 20){
                            NavigationLink(destination: ContentView()) {
                                Text("Go back")
                                    .foregroundColor(.white)
                                    .bold()
                                    .frame(width: 90,height: 40)
                                    .background(.green)
                                    .cornerRadius(10)
                            }
                            .navigationBarBackButtonHidden(true)
                            
                            Button{
                                isRecorded.toggle()
                                if isRecorded {
                                    recorded += videoStream.luminosityReading
                                }
                            }
                        label:{
                            Image(systemName: "camera.aperture")
                            //                    .resizable()
                                .font(.title)
                            
                        }
                            
                            Button{
                                showList.toggle()
                            }
                        label:{
                            Text("Show List")
                                .foregroundColor(.white)
                                .bold()
                                .frame(width: 90,height: 40)
                                .background(.green)
                                .cornerRadius(10)
                        }
                            
                            
                        }//hstack
                    }
                    
                    //                    Button{
                    //                        isRecorded.toggle()
                    //                        if isRecorded {
                    //                            recorded += videoStream.luminosityReading
                    //                        }
                    //                    }
                    //            label:{
                    //                Image(systemName: "camera.aperture")
                    //                    .resizable()
                    //                    .font(.title)
                    //
                    //            }
                    
                    //                        .toolbar {
                    //                            ToolbarItem(id: "Record LUX", placement: .bottomBar) {
                    //                                NavigationLink(destination: PlantView()) {
                    //                                    Button{
                    //                                        isRecorded.toggle()
                    //                                        if isRecorded {
                    //                                            recorded += videoStream.luminosityReading
                    //                                        }
                    //                                    }
                    //                            label:{
                    //                                Image(systemName: "camera.aperture")
                    //                                    .resizable()
                    //                                    .font(.title)
                    //
                    //                            }
                    //                                }
                    //                            }
                    //                        }
                    
                }
                .sheet(isPresented: $showList){
                    PlantView()
                }
            }.onAppear{
                    print("View has been loaded \(viewCounting.viewCounter) times.")
                    
                    if viewCounting.viewCounter > 10 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4, execute: {
                            requestReview()
                        })
                    } else {
                        viewCounting.viewCounter += 1
                        UserDefaults.standard.set(viewCounting.viewCounter, forKey: "ViewCounter")
                    }
                }
            }
               
//
        }
        
    }
}


/*
 Account for how many times the view has been loaded.
 If the view has been loaded more than ten times, request the user
 to review the app.
 */
class ViewCounting: ObservableObject {
    public var viewCounter: Int = (UserDefaults.standard.object(forKey: "ViewCounter") as? Int) ?? 0
}
