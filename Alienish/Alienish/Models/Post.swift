//
//  Post.swift
//  Alienish
//
//  Created by Zach Soles on 8/20/20.
//  Copyright © 2020 Zach Soles. All rights reserved.
//

import Foundation

struct PostResponse: Decodable {
    let results: [Post]
}

/// A post from the Reddit API
struct Post: Decodable, Identifiable {
    let title: String
    let name: String
    let id: String
    /// The body of the post
    let selftext: String
    let selftext_html: String?
    let thumbnail: String
    let url: String
    let author: String
    let subreddit: String
    let score: Int
    let num_comments: Int
//    let stickied: Bool
//    let created_utc: Double
//    let preview: Preview?
//
//    let link_flair_text: String?
//    let is_original_content: Bool
//    let spoiler: Bool
//
//    var flairs: [String] {
//        var res: [String] = []
//        if link_flair_text != nil {
//            res.append(link_flair_text!)
//        }
//        if is_original_content {
//            res.append("OC")
//        }
//        if spoiler {
//            res.append("Spoiler")
//        }
//        return res
//    }
//
    let replies: [Self]?
    
    var imageURL: URL {
        return URL(string: thumbnail)!
    }
    
    var returnURL : URL {
        return URL(string: url)!
    }
    
    
    struct Preview: Decodable {
        let images: [PreviewImage]
        let enabled: Bool
        
        struct PreviewImage: Decodable {
            let source: ImageSource
            let resolutions: [ImageSource]
            let id: String
            
            struct ImageSource: Decodable {
                let url: String
                let width: Int
                let height: Int
            }
        }
    }
}

#if DEBUG
extension Post {
    /// Used to create a Post for example Debug purposes
    static var example: Self {
        return Post(
            title: "Hello World | This is secondary text",
            name: "hello-world",
            id: "hw",
            selftext: "This is some body content. Blah blah\nblah blah blah",
            selftext_html: nil,
            thumbnail: "https://b.thumbs.redditmedia.com/FXmSP5K5G3mRBHqWtsPg-rYr2Oe3P1HeduIXISVDmpo.jpg",
            url: "",
            author: "me",
            subreddit: "swift",
//            score: 1000,
            score: 50,
            num_comments: 77,
            
//            stickied: true,
//            created_utc: Date().timeIntervalSince1970 - 100,
//            preview: nil,
//            link_flair_text: "Hello World",
//            is_original_content: true,
//            spoiler: false,
            replies: nil
        )
    }
}
#endif
