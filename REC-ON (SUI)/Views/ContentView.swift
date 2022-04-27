//
//  ContentView.swift
//  REC-ON (SUI)
//
//  Created by Miguel Tor on 3/30/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView{
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text ("Home")
                }
            
//            ChatView()
//                .tabItem {
//                    Image(systemName: "message.fill")
//                    Text ("Chats")
//                }
        }
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
