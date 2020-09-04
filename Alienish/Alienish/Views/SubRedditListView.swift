//
//  PostCardListView.swift
//  Alienish
//
//  Created by Zach Soles on 8/20/20.
//  Copyright © 2020 Zach Soles. All rights reserved.
//
import SwiftUI

struct SubRedditListView: View {
    let query: String
    @ObservedObject var listingViewModel: ListingViewModel
    
    @State private var subredditTitle = "r/"
    var body: some View {
        PostCardListView(posts: listingViewModel.posts, query: query.lowercased())
        .onAppear(perform: fetchListing)
        .navigationBarTitle(Text(subredditTitle + query), displayMode: .inline)
        
    }
    
    private func fetchListing() {
        listingViewModel.fetchListing(for: query.lowercased())
    }
}

struct SubRedditListView_Previews: PreviewProvider {
    static var previews: some View {
        SubRedditListView(query: "all", listingViewModel: ListingViewModel(service: RedditAPILoader()))
    }
}
