//
//  ContentView.swift
//  Alienish
//
//  Created by Zach Soles on 8/20/20.
//  Copyright © 2020 Zach Soles. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            SearchView()
                .tabItem {
                    VStack{
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }
            FavoriteListView(arr: [sub(name: "All"), sub(name: "Apple"), sub(name: "PCGaming")])
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Posts")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
