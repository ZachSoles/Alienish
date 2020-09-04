//
//  SearchView.swift
//  Alienish
//
//  Created by Zach Soles on 8/21/20.
//  Copyright © 2020 Zach Soles. All rights reserved.
//
import SwiftUI
struct SearchView: View {
    @State private var query = " "
    @ObservedObject private var listingViewModel = ListingViewModel(service: RedditAPILoader())
    @State private var subredditTitle = "r/"

    
    
    var body: some View {
        NavigationView{
            VStack {
                TextField("Search Subreddit", text: self.$query) {
                    self.subredditTitle = "r/\(self.query.lowercased())"
                    self.fetchListing()
                }.textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                PostCardListView(posts: listingViewModel.posts, query: query.lowercased())
            }
            .navigationBarTitle("Search", displayMode: .inline)
        }
    }
    
    private func fetchListing() {
        listingViewModel.fetchListing(for: query.lowercased())
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

