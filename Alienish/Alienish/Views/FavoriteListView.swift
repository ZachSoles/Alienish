//
//  SubredditListView.swift
//  Alienish
//
//  Created by Zach Soles on 8/21/20.
//  Copyright © 2020 Zach Soles. All rights reserved.
//

import SwiftUI

struct sub {
    var name: String
}

struct FavoriteListView: View {
    let arr : [sub]

    
    var body: some View {
        NavigationView {
            List{
                ForEach(arr, id: \.name) { sub in
                    NavigationLink(destination: SubRedditListView(query: sub.name, listingViewModel: ListingViewModel(service: RedditAPILoader()))) {
                        Text("r/"+sub.name)
                    }
                }
            }
            .navigationBarTitle(Text("My Subreddits"))
        }
    }

}

struct FavoriteListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteListView(arr: [sub(name: "all"), sub(name: "apple"), sub(name: "pcgaming")])
    }
}
