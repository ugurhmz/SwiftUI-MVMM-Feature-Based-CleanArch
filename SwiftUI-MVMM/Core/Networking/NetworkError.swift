//
//  NetworkError.swift
//  SwiftUI-MVMM
//
//  Created by rico on 18.12.2025.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case responseError
    case decodingError
    case unauthorized
    case unknown
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Gecersiz URL"
        case .responseError:
            return "Sunucu hatasi alindi . . ."
        case .decodingError:
            return "Veri Decode edilemedi..."
        case .unauthorized:
            return "Yetkisiz istekte bulunuldu."
        case .unknown:
            return "Bilinmeyen Hata"
        }
    }
}
