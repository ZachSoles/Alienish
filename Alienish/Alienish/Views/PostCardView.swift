//
//  PostCardView.swift
//  Alienish
//
//  Created by Zach Soles on 8/20/20.
//  Copyright © 2020 Zach Soles. All rights reserved.
//

//import SwiftUI
//
//struct PostCardView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct PostCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostCardView()
//    }
//}

import SwiftUI

struct PostCardView: View {
    let Post: Post
    let showSub: Bool
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
//        Text(Post.title)
        HStack{
            VStack(alignment: .leading, spacing: 10){
                Text(Post.title)
                    .lineLimit(2)
                    .font(.headline)
                Text("u/"+Post.author)
                    .font(.footnote)
                if(showSub) {
                    Text(Post.subreddit)
                }
            }
            Spacer()
            ZStack{
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                if self.imageLoader.image != nil{
                    Image(uiImage: self.imageLoader.image!)
                        .resizable()
                }
            }
            .frame(width: 100,height:100)
            .aspectRatio(contentMode: .fit)
            .cornerRadius(8)
            .shadow(radius: 4)
            }
        .lineLimit(1)
            .onAppear{
                self.imageLoader.loadImage(with: self.Post.imageURL)
            }
    }
}

#if DEBUG
struct PostCardView_Previews: PreviewProvider {
    static var previews: some View {
        PostCardView(Post: Post.stubbedPost, showSub: true)
    }
}
#endif
