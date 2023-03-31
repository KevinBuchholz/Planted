//
//  MainTabView.swift
//  Planted
//
//  Created by Jacquese Whitson  on 3/30/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            SuggestedView()
                .tabItem {
                    Label("Menu", systemImage: "camera.macro")
                }
            
            ContentView()
                .tabItem {
                    Label("Menu", systemImage: "house.fill")
                }
            
            CalenderView()
                .tabItem {
                    Label("Menu", systemImage: "calendar")
                }
            
            
            
            
            
            
        }
        
    }
     
}
        
    

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
