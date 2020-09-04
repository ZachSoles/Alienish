//
//  Listing.swift
//  Alienish
//
//  Created by Zach Soles on 8/20/20.
//  Copyright © 2020 Zach Soles. All rights reserved.
//

import Foundation


import Combine
import SwiftUI

class ListingViewModel: ObservableObject {
    let service: RedditAPILoader

    @Published var subreddit = "r/all"
    @Published var posts = [Post]()
    @Published var comments = [Comment]()

    init(service: RedditAPILoader) {
        self.service = service
    }
    
    func fetchPost(for query: Post) {
        service.getPost(for: query) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self?.comments = comments
                case .failure:
                    self?.comments = []
                }
            }
        }
    }

    func fetchListing(for query: String) {
        service.searchSubreddit(for: query) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let posts):
                    self?.posts = posts
                case .failure:
                    self?.posts = []
                }
            }
        }
    }
}

/// Root of Reddit API response
struct Listing: Decodable {
    let data: ListingData
    var posts: [Post] {
        return data.children.map { (postData) -> Post in
//            print(postData.data.title)
            return postData.data
        }
    }
    
    struct ListingData: Decodable {
        let children: [PostData]
        
        struct PostData: Decodable {
            let data: Post
        }
    }
}

/// Root of Reddit API response for comments
struct CommentListing: Decodable {
    let data: CommentListingData
    
    var comments: [Comment] {
        return data.children.map { (commentData) -> Comment in
            return commentData.data
        }
    }
    
    struct CommentListingData: Decodable {
        let children: [CommentData]
        
        struct CommentData: Decodable {
            let data: Comment
        }
    }
}
