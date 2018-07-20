//
//  Article.swift
//  RxSwift+MVVM
//
//  Created by Dongcheng Deng on 2018-07-19.
//  Copyright © 2018 Showpass. All rights reserved.
//

import Foundation

// Only decode the field we need
struct Article: Decodable {
  var title: String
}

// Only decode the field we need
struct ResponseData: Decodable {
  var articles: [Article]
}
