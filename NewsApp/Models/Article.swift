//
//  Article.swift
//  NewsApp
//
//  Created by Usertqi on 04/08/21.
//

import Foundation

struct MyStruct: Codable, Identifiable {
    let id = UUID()
    var name: String
    //... other properties
    enum CodingKeys: String, CodingKey {
        case name
        //... deine all keys except `id`
    }
}
struct ArticlesResponse: Codable {
    let articles: [Article]
}

struct Article: Codable, Identifiable {
    let id = UUID()
    var title: String
    var url: String
    var image: String?
    var source: String
}

extension Article {
    
    static var dummyData: Article {
        return Article(title: "A year after the Beirut blast, survivors are still grieving, still angry, and still waiting for justice - CNN", url: "https://www.cnn.com/2021/08/03/middleeast/beirut-blast-anniversary-grief-anger-wedeman-intl-cmd/index.html", image: "https://cdn.cnn.com/cnnnext/dam/assets/210803170143-01-beirut-port-blast-file-restricted-super-tease.jpg", source: "CNN")
    }
}
