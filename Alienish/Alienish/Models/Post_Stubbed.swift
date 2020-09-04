//
//  Post_Stubbed.swift
//  Alienish
//
//  Created by Zach Soles on 8/20/20.
//  Copyright © 2020 Zach Soles. All rights reserved.
//

import Foundation

extension Post{
    static var stubbedPosts: [Post] {
        let response: Listing? = try? Bundle.main.loadAndDecodeJson(fileName: "post_info")
        return response!.posts
    }
    
    static var stubbedPost: Post{
        stubbedPosts[0]
    }
}

extension Bundle{
    func loadAndDecodeJson<D: Decodable>(fileName: String) throws -> D? {
        guard let url = self.url(forResource: fileName, withExtension: "json") else {
            return nil
        }
        let data = try Data(contentsOf: url)
        let jsonDecoder = Utils.jsonDecoder
        let decodedModel = try jsonDecoder.decode(D.self, from: data)
        return decodedModel
    }
}
