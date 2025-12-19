//
//  MovieService.swift
//  SwiftUI-MVMM
//
//  Created by rico on 18.12.2025.
//

import Foundation

protocol MovieServiceProtocol {
    func fetchMovies(page: Int) async throws -> [MovieResponseModel]
}

final class MovieService: MovieServiceProtocol {
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    
    func fetchMovies(page: Int) async throws -> [MovieResponseModel] {
        try? await Task.sleep(for: .seconds(1))
        
        let endPoint = MoviesEndPoint.discover(page: page)
        let response = try await networkManager.request(endpoint: endPoint, type: MovieGeneralResponse.self)
        
        return response.results ?? []
    }
}
