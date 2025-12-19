//
//  MovieListView.swift
//  SwiftUI-MVMM
//
//  Created by rico on 18.12.2025.
//

import SwiftUI

struct MovieListView: View {
    @StateObject private var movieViewModel = MoviesViewModel()
    
    var body: some View {
        NavigationStack {
            List(movieViewModel.movies) {item in
                Text(item.title)
            }
            .task {
                await movieViewModel.loadMovies()
            }
        }
       
    }
}

#Preview {
    MovieListView()
}
