//
//  BookRepository.swift
//  WBooks
//
//  Created by Salvador Carnelutti on 28/05/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import Result
import Alamofire

internal class BookRepository {
    
    // Fetch with alamofire request
    public func fetchBooks(onSuccess: @escaping ([Book]) -> Void, onError: @escaping (Error) -> Void) {
        // Build URL
        let url = URL(string: "https://swift-training-backend.herokuapp.com/books")!
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
                            onError(BookError.decodeError)
                            return
                    }
                    //Check if data is valid, if not call error function
                    guard let books = try? JSONDecoder().decode([Book].self, from: JSONbooks) else {
                        onError(BookError.decodeError)
                        return
                    }
                    // Request was successful and data is valid so we call success function
                    onSuccess(books)
                    
                case .failure(let error):
                    // Request failed so we call the error function
                    onError(error)
                }
        }
    }
}

enum BookError: Error {
    case decodeError
}
