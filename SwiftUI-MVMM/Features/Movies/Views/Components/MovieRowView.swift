//
//  MovieRowView.swift
//  SwiftUI-MVMM
//
//  Created by rico on 19.12.2025.
//

import SwiftUI

struct MovieRowView: View {
    let movieDto: MovieDTO
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            MoviePosterView(url: movieDto.posterURL)
            
            VStack(alignment: .leading) {
                Text(movieDto.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: false)
                
                HStack(spacing: 8) {
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .font(.caption2)
                            .foregroundStyle(.yellow)
                        Text(movieDto.ratingFormatted)
                            .font(.caption.bold())
                            .foregroundStyle(.primary)
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.yellow.opacity(0.2))
                    .clipShape(Capsule())
                    
                    Text(movieDto.releaseYear)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                
                Text(movieDto.overview)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
            }
            Spacer()
        }
        .padding(12)
        .background(Color(uiColor: .systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.05), radius: 5, x:0, y:2)
        .padding(.horizontal, 16)
        .padding(.vertical, 6)
            
    }
}

#Preview {
    MovieRowView(movieDto: MovieDTO(
        id: 425274,
        title: "Now You See Me: Now You Don't",
        overview: "The original Four Horsemen reunite with a new generation of illusionists to take on powerful diamond heiress Veronika Vanderberg.",
        posterURL: URL(string: "https://image.tmdb.org/t/p/w500/oD3Eey4e4Z259XLm3eD3WGcoJAh.jpg"),
        ratingFormatted: "6.3",
        releaseYear: "2025"
    ))
}
