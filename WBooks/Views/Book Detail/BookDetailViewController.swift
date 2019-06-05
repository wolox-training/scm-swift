//
//  BookDetailViewController.swift
//  WBooks
//
//  Created by Salvador Carnelutti on 03/06/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import Foundation
import UIKit
import WolmoCore

class BookDetailViewController: UIViewController {
    private var _view: BookDetailView = BookDetailView.loadFromNib()!
    private var _commentRepository: CommentRepository = CommentRepository()
    private var _viewModel: BookViewModel
    private var _bookDetailViewModel: BookDetailViewModel
    
    init(bookVM: BookViewModel) {
        _viewModel = bookVM
        _bookDetailViewModel = BookDetailViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _view.backgroundColor = UIColor(red: 0.92, green: 0.96, blue: 0.98, alpha: 1.0)
        _view.detailTable.dataSource = self
        _view.detailTable.delegate = self
        _view.detailTable.register(cell: BookDetailCell.self)
        navigationItem.title = "BOOK DETAIL"
        setCurrentBook()
        _commentRepository.fetchComments(
            bookID: _viewModel.id,
            onSuccess: { [weak self] comments in
                self?._bookDetailViewModel.comments = comments.map { CommentViewModel(comment: $0) }
                print(comments)
                //self?._viewModel.books = books.map { BookViewModel(book: $0) }
                self?._view.detailTable?.reloadData()
            }, onError: { error in
                print(error)
        })
    }
}

extension BookDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func setCurrentBook() {
        _view.lblBookTitle.text = _viewModel.title
        _view.lblStatus.text = _viewModel.status.capitalized

        _view.lblAuthor.text = _viewModel.author
        _view.lblYear.text = _viewModel.year
        _view.lblGenre.text = _viewModel.genre
        let imageUrl = URL(string: _viewModel.image)
        let data = try? Data(contentsOf: imageUrl ?? "http://wolox-training.s3.amazonaws.com/uploads/6942334-M.jpg")
        if let imageData = data {
            let bookImage = UIImage(data: imageData)
            _view.imgBookCover.image = bookImage
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _bookDetailViewModel.comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cell: BookDetailCell.self)!
        let commentView = _bookDetailViewModel.comments[indexPath.row]
        cell.lblUser.text = commentView.user.username
        cell.lblComment.text = commentView.content
        let imageUrl = URL(string: commentView.user.image)
        let data = try? Data(contentsOf: imageUrl ?? "https://goo.gl/1PBWVM")
        if let imageData = data {
            let bookImage = UIImage(data: imageData)
            cell.imageUser.image = bookImage
        }
        return cell
    }
}
