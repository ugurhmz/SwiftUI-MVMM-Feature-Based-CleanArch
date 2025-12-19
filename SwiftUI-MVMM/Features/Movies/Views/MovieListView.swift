//
//  MovieListView.swift
//  SwiftUI-MVMM
//
//  Created by rico on 18.12.2025.
//

import SwiftUI

struct MovieListView: View {
    @StateObject private var movieVM = MoviesViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                    contentBuilder
            }
            .task {
                await movieVM.loadMovies()
            }
        }
       
    }
}

// MARK: -
extension MovieListView {
    
    //contentBuilder
    @ViewBuilder
    private var contentBuilder: some View {
        switch movieVM.state {
        case .loading:
            ProgressView()
                .controlSize(.large)
                .tint(.green)
        case .error:
            VStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.system(size: 50))
                    .foregroundStyle(.red)
                    .opacity(0.7)
                Text("Oops Error !")
                    .font(.headline)
                Text(movieVM.errorMessage ?? "Unk. Err")
                    .font(.title3)
                    .foregroundStyle(.black.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Button("Try Again") {
                    Task {
                        await movieVM.loadMovies()
                    }
                }
                .buttonStyle(.borderedProminent)
                .padding(.top, 24)
            }
            
        case .idle:
            if movieVM.movies.isEmpty {
                Text("Not Found movies . . .")
                    .font(.title)
                    .foregroundStyle(.gray)
            } else {
                movieList
            }
        }
    }
    
    // movieList
    private var movieList: some View {
        List {
            Text("Movies")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 10)
                .padding(.bottom, 8)
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            
            ForEach(movieVM.movies, id:\.id) { movie in
                ZStack {
                    MovieRowView(movieDto: movie)
                    NavigationLink(value: movie) {
                        EmptyView()
                    }
                }
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 6, leading:0, bottom: 6, trailing: 0))
                .onAppear {
                    movieVM.loadMoreMovies(currentItem: movie)
                }
            }
            
            if !movieVM.movies.isEmpty {
                HStack {
                    Spacer()
                    ProgressView()
                        .id(UUID())
                        .controlSize(.regular)
                        .tint(.white)
                    Spacer()
                }
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                .padding(.vertical, 8)
            }
            
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
    }
}


#Preview {
    MovieListView()
}
