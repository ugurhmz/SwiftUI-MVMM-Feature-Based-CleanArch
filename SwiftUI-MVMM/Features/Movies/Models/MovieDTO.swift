//
//  MovieDTO.swift
//  SwiftUI-MVMM
//
//  Created by rico on 19.12.2025.
//

import Foundation

struct MovieDTO: Identifiable, Hashable {
    let id: Int
    let title: String
    let overview: String
    let posterURL: URL?
    let ratingFormatted: String
    let releaseYear: String
}
