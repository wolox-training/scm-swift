//
//  BookDetailViewModel.swift
//  WBooks
//
//  Created by Salvador Carnelutti on 04/06/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import Foundation
import ReactiveSwift

class BookDetailViewModel {
    
    public var comments: Property<[CommentViewModel]>
    private var _comments: MutableProperty<[CommentViewModel]> = MutableProperty([])
    private var _commentRepository: CommentRepository = CommentRepository()
    
    init() {
        comments = Property(_comments)
    }
    
    func getComments(bookId: Int) {
        _commentRepository.fetchComments(
            bookID: bookId, onSuccess: { [weak self] comments in
                self?._comments.value = comments.map { CommentViewModel(comment: $0) }
            }, onError: { error in
                print(error)
        })
    }
    
    func getComment(at index: Int) -> CommentViewModel? {
        if 0..<_comments.value.count ~= index {
            return _comments.value[index]
        }
        return .none
    }
}
