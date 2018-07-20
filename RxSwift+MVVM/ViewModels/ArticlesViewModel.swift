//
//  ArticlesViewModel.swift
//  RxSwift+MVVM
//
//  Created by Dongcheng Deng on 2018-07-19.
//  Copyright © 2018 Showpass. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

class ArticlesViewModel {
  static let ARTICLE_ENDPOINT: String = "https://newsapi.org/v1/articles?source=the-next-web&sortBy=latest&apiKey=0cf790498275413a9247f8b94b3843fd"
  
  let articlesVariable = Variable<[Article]>([])  // An reative varible to hold the article list
  
  func loadArticles() {
    Alamofire.request(ArticlesViewModel.ARTICLE_ENDPOINT).responseJSON { response in
      // Decode the response using Decodable protocol from Swift 4
      // The expected type is the ResponseData class, which has an array of Articles
      if let data = response.data, let decoded = try? JSONDecoder().decode(ResponseData.self, from: data) {
        self.articlesVariable.value.append(contentsOf: decoded.articles)
      }
    }
  }
}
