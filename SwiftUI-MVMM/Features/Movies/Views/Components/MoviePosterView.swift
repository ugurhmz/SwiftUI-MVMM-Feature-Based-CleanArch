//
//  MoviePosterView.swift
//  SwiftUI-MVMM
//
//  Created by rico on 18.12.2025.
//

import SwiftUI
import Kingfisher

struct MoviePosterView: View {
    let url: URL?
    
    var body: some View {
        KFImage(url)
            .placeholder {
                Rectangle()
                    .fill(Color.black.opacity(0.3))
                    .overlay(
                            ProgressView()
                                .tint(.green)
                    )
            }
            .fade(duration: 0.25)
            .onFailure { error in
                print("Resim yükleme hatası: \(error)")
            }
            .resizable()
            .loadDiskFileSynchronously()
            .cacheOriginalImage()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 150)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(color:.black.opacity(0.2), radius: 4, x: 0, y: 2)
            .background(
                ZStack {
                    if url == nil {
                        Color.gray.opacity(0.1)
                        Image(systemName: "photo.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.tertiary)
                    }
                }
            )
        
    }
}

#Preview {
    MoviePosterView(url: URL(string: ""))
}
