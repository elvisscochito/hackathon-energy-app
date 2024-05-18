//
//  PageModel.swift
//  app
//
//  Created by Elviro Dominguez Soriano on 18/05/24.
//

import Foundation

struct PageModel: Identifiable, Equatable {
    let id = UUID()
    var title: String
    var headline: String
    var pageNumber: Int
    
    static var defaultPage = PageModel(title: "Title", headline: "Aa", pageNumber: 0)
    
    static var samplePages: [PageModel] = [
        PageModel(title: "Aa", headline: "Aa", pageNumber: 0),
        PageModel(title: "Aa", headline: "Aa", pageNumber: 1),
        PageModel(title: "Aa", headline: "Aa", pageNumber: 2)
    ]
}
