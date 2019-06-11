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
    private var _bookComponentView: BookDetailComponent = BookDetailComponent.loadFromNib()!
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
        
        bindViewModel()
        _bookDetailViewModel.getComments(bookId: _viewModel.id)
    }
}

extension BookDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _bookDetailViewModel.comments.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cell: BookDetailCell.self)!
        let commentView = _bookDetailViewModel.getComment(at: indexPath.row)!
        
        //Comment's cell components assignment.
        cell.lblUser.text = commentView.user.username
        cell.lblComment.text = commentView.content
        let imageUrl = URL(string: commentView.user.image)
        
        //User image assignment.
        let data = try? Data(contentsOf: imageUrl ?? "https://goo.gl/1PBWVM")
        if let imageData = data {
            cell.imageUser.image = UIImage(data: imageData)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return (_view.detailTable.frame.width)*0.805
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        _bookComponentView.lblBookTitle.text = _viewModel.title
        _bookComponentView.lblStatus.text = _viewModel.status.capitalized
        _bookComponentView.lblYear.text = _viewModel.year
        _bookComponentView.lblGenre.text = _viewModel.genre
        _bookComponentView.lblAuthor.text = _viewModel.author
        let imageUrl = URL(string: _viewModel.image)
        let data = try? Data(contentsOf: imageUrl ?? "http://wolox-training.s3.amazonaws.com/uploads/6942334-M.jpg")
        if let imageData = data {
            _bookComponentView.imgBookCover.image = UIImage(data: imageData)
        }
        return _bookComponentView
    }
}

extension BookDetailViewController {
    
    func bindViewModel() {
        _bookDetailViewModel.comments.producer.startWithResult { [weak self] _ in
            self?._view.detailTable.reloadData()
        }
    }
}
