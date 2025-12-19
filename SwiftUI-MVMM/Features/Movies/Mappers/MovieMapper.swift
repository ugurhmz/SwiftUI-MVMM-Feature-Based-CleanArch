//
//  MovieMapper.swift
//  SwiftUI-MVMM
//
//  Created by rico on 19.12.2025.
//

import Foundation

extension MovieResponseModel {
    func toDto(response: MovieResponseModel) -> MovieDTO {
        let val = response.voteAverage ?? 0.0
        
        return MovieDTO(id: response.id ?? 0,
                        title: response.title ?? "-",
                        overview: response.overview ?? "-",
                        posterURL: response.fullPosterURL ?? URL(string: ""),
                        ratingFormatted: String(format: "⭐️ %.1f", val),
                        releaseYear: response.releaseDate ?? "-")
    }
}
