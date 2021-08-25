//
//  ResultStates.swift
//  NewsApp
//
//  Created by Usertqi on 04/08/21.
//

import Foundation

enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
