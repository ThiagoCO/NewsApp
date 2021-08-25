//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Usertqi on 04/08/21.
//

import Foundation
import Combine

protocol NewsViewModelProtocol {
    func getArticles()
}

class NewsViewModel: NewsViewModelProtocol, ObservableObject {
    
    private let service: NewsService
    private(set) var articles = [Article]()
    private var cancellables = Set<AnyCancellable>()
    @Published private(set) var state: ResultState = .loading
    
    init(service: NewsService) {
        self.service = service
    }
    
    func getArticles() {
        let res = service
            .request(from: .getNews)
            .sink { res in
                switch res {
                case .finished:
                    self.state = .success(content: self.articles)
                case .failure(let error):
                    self.state = .failed(error: error)
                }
            } receiveValue: { response in
                self.articles = response.articles
            }
        self.cancellables.insert(res)

    }
    
}

