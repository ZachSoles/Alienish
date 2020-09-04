//
//  API.swift
//  Alienish
//
//  Created by Zach Soles on 8/20/20.
//  Copyright © 2020 Zach Soles. All rights reserved.
//

import Foundation

struct API {
    static func subredditURL(_ subreddit: String, _ sortBy: SortBy) -> String {
        return "https://www.reddit.com/r/\(subreddit)/\(sortBy.rawValue).json"
    }
    
    static func postURL(_ subreddit: String, _ id: String) -> String {
        return "https://www.reddit.com/r/\(subreddit)/\(id).json"
    }
    
    static func commentURL(post: Post) -> String {
        return "https://www.reddit.com/r/\(post.subreddit)/comments/\(post.id)"
    }
}
