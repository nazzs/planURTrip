//
//  ContentView.swift
//  planURtrip
//
//  Created by Naz Sevim on 7.07.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var label = ""
    @State var activeView: Int = 0
    @State var toNext = false
    
    var body: some View {
        TabView(selection: $activeView) {
            SearchView(searchText: $label, toNext: $toNext)
                    .tabItem() {
                        Image(systemName: "magnifyingglass")
                        Text("Ara")
                    }
                    .tag(0)
                FavsView()
                    .tabItem() {
                        Image(systemName: "heart.fill")
                        Text("Favoriler")
                    }
                    .tag(1)
                PlansView()
                    .tabItem() {
                        Image(systemName: "airplane.departure")
                        Text("Planlar")
            }
                    .tag(2)
        }
        .accentColor(.purple)
        .onChange(of: activeView){ value in
            if(value == 0){
                toNext = false
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
