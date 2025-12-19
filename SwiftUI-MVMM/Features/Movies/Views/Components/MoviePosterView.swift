//
//  MoviePosterView.swift
//  SwiftUI-MVMM
//
//  Created by rico on 18.12.2025.
//

import SwiftUI

struct MoviePosterView: View {
    let url: URL?
    
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                Rectangle()
                    .fill(Color.gray.opacity(0.5))
                    .overlay(ProgressView())
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            case .failure(_):
                ZStack {
                    Color.gray.opacity(0.1)
                    Image(systemName: "photo.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.tertiary)
                    
                }
            @unknown default:
                EmptyView()
            }
        }
        .frame(width: 80, height: 120)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
        
    }
}

#Preview {
    MoviePosterView(url: URL(string: ""))
}
