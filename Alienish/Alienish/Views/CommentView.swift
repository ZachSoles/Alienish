//
//  CommentView.swift
//  Alienish
//
//  Created by Zach Soles on 8/30/20.
//  Copyright © 2020 Zach Soles. All rights reserved.
//

import SwiftUI

struct CommentView: View {
    let comments: [Comment]

    var body: some View {
        List {
            ForEach(comments) { comment in
                SingleCommentView(comment: comment)
            }
        }
    }
}

struct SingleCommentView: View {
    let comment: Comment

    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 10){
                Text(String(comment.body!))
                HStack {
                    Text(String(comment.score))
                    Text(String(comment.author))
                }
            }
        }
    }
}


struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView(comments: [Comment.init(nested: 1)])
    }
}
