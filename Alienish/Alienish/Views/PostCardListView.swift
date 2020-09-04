//
//  PostCardListView.swift
//  Alienish
//
//  Created by Zach Soles on 8/20/20.
//  Copyright © 2020 Zach Soles. All rights reserved.
//
import SwiftUI

struct PostCardListView: View {
    let posts : [Post]
    let query: String
    
    var body: some View {
        List {
            ForEach(posts) { post in
                NavigationLink(destination: PostDetailView(Post: post)){
                    PostCardView(Post: post, showSub: self.query.lowercased() == "all")
                }
            }
        }
    }
}

struct PostCardListView_Previews: PreviewProvider {
    static var previews: some View {
        PostCardListView(posts: [], query: "all")
    }
}
