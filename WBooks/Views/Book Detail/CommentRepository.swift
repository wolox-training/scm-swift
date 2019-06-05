//
//  CommentRepository.swift
//  WBooks
//
//  Created by Salvador Carnelutti on 03/06/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import Result
import Alamofire

internal class CommentRepository {

    // Fetch with alamofire request
    public func fetchComments(bookID: Int, onSuccess: @escaping ([Comment]) -> Void, onError: @escaping (Error) -> Void) {
        // Build URL
        let url = URL(string: "https://swift-training-backend.herokuapp.com/books/\(bookID)/comments")!
        // Make request to url with get method
        request(url, method: .get).responseJSON // Handle response
            { response in
                //Check if request was succesful
                switch response.result {
                // Request was successful
                case .success(let value):
                    //Check if data is valid, if not call error function
                    guard let JSONbooks = try? JSONSerialization.data(
                        withJSONObject: value, options: []) else {
                            onError(CommentError.decodeError)
                            return
                    }
                    //Check if data is valid, if not call error function
                    guard let comments = try? JSONDecoder().decode([Comment].self, from: JSONbooks) else {
                        onError(CommentError.decodeError)
                        return
                    }
                    // Request was successful and data is valid so we call success function
                    onSuccess(comments)

                case .failure(let error):
                    // Request failed so we call the error function
                    onError(error)
                }
        }
    }
}

enum CommentError: Error {
    case decodeError
}
