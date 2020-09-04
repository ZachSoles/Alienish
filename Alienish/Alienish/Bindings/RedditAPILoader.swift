//
//  SubRedditListState.swift
//  Alienish
//
//  Created by Zach Soles on 8/21/20.
//  Copyright © 2020 Zach Soles. All rights reserved.
//

import Foundation

class RedditAPILoader {
    private let session: URLSession
    private let decoder: JSONDecoder
    
    
    init(session: URLSession = .shared, decoder: JSONDecoder = .init()) {
        self.session = session
        self.decoder = decoder
    }
    
    struct FailableDecodable<Base : Decodable> : Decodable {

        let base: Base?

        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            self.base = try? container.decode(Base.self)
        }
    }
    
    func getPost(for query: Post, completion: @escaping (Result<[Comment], Error>) -> Void) {
//        guard let url = URL(string: "https://www.reddit.com/\(query.subreddit.count == 0 ? "" : "r/\(query.subreddit)/comments/\(query.id.count == 0 ? "" : query.id)/").json") else {
//            preconditionFailure("Failed to construct search URL for query: \(query)")
//        }
        let url = URL(string: "https://www.reddit.com/r/apple/comments/.json")
        session.dataTask(with: url!) { [weak self] data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else {
                do {
                    let data = data ?? Data()
                    let response = try self?.decoder.decode(CommentListing.self, from: data)
                    completion(.success(response?.comments ?? []))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    func searchSubreddit(for query: String, completion: @escaping (Result<[Post], Error>) -> Void) {
        let trimmedQuery = query.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let url = URL(string: "https://www.reddit.com/\(trimmedQuery.count == 0 ? "" : "r/\(trimmedQuery)").json") else {
            preconditionFailure("Failed to construct search URL for query: \(query)")
        }
        
        session.dataTask(with: url) { [weak self] data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else {
                do {
                    let data = data ?? Data()
                    let response = try self?.decoder.decode(Listing.self, from: data)
                    completion(.success(response?.posts ?? []))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
