//
//  PostDetailView.swift
//  Alienish
//
//  Created by Zach Soles on 8/30/20.
//  Copyright © 2020 Zach Soles. All rights reserved.
//

import SwiftUI
import Request

struct PostDetailView: View {
    
    let Post: Post
    @ObservedObject var imageLoader = ImageLoader()
    @ObservedObject private var listingViewModel = ListingViewModel(service: RedditAPILoader())
    
    private func fetchPost() {
        listingViewModel.fetchPost(for: Post)
    }
    
    var body: some View {
        ScrollView(.vertical){
            VStack (alignment: .leading, spacing: 6) {
                ZStack (alignment: .center){
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                    if self.imageLoader.image != nil{
                        Image(uiImage: self.imageLoader.image!)
                            .resizable()
//                            .aspectRatio(contentMode: .fit)
                        
                    }
                }
                Text(Post.title)
                    .font(.title)
                    .padding(.leading, 10)
                HStack{
                    Text("in ")
                    Text(Post.subreddit)
                    Text(" by ")
                    Text(Post.author)
                }
                    .font(.subheadline)
                .padding(.leading, 10)
            }
            CommentView(comments: listingViewModel.comments)
//            Text(String(listingViewModel.comments.count))
        }
        .onAppear{
            self.fetchPost()
            self.imageLoader.loadImage(with: self.Post.returnURL)
        }
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(Post: Post.stubbedPost)
    }
}
