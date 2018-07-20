//
//  ViewController.swift
//  RxSwift+MVVM
//
//  Created by Dongcheng Deng on 2018-07-19.
//  Copyright © 2018 Showpass. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ArticlesViewController: UIViewController, UIScrollViewDelegate {
  
  private let viewModel = ArticlesViewModel()
  private let disposeBag = DisposeBag()   // Responsible for killing rx observers when VC is deinited

  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    bindViewModel()
    viewModel.loadArticles()
  }
}


// MARK: - RxSwift
extension ArticlesViewController {
  func bindViewModel() {
    tableView.rx.setDelegate(self)
      .disposed(by: disposeBag)
    
    // Reload the same data and then append to article list to pretend that we have infinite number of articles
    // Only load when hit the bottom
    tableView.rx.willDisplayCell
      .subscribe(onNext: { [weak self] (_, indexPath) in
        if indexPath.row + 1 == self?.viewModel.articlesVariable.value.count {
          self?.viewModel.loadArticles()
        }
      })
      .disposed(by: disposeBag)
    
    // Setup cell
    // Driver makes sure that the block is executed in the main thread
    viewModel.articlesVariable.asDriver()
      .drive(tableView.rx.items(cellIdentifier: "Cell", cellType: ArticleCell.self)) { (index, article: Article, cell) in
        cell.titleLabel.text = article.title
      }.disposed(by: disposeBag)
  }
}

