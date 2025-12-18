//
//  EndpointProtocol.swift
//  SwiftUI-MVMM
//
//  Created by rico on 18.12.2025.
//

import Foundation
import Alamofire

protocol EndPointProtocol {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeader? { get }
    var paramters: Parameters? { get }
    var encoding: ParameterEncoding { get }
}

extension EndPointProtocol {
    var baseURL: String {
        return APIConstants.baseURL
    }
    
    var headers: HTTPHeaders? {
        return [
            "Authorization": "Bearer \(APIConstants.bearerToken)",
            "accept" : "application/json"
        ]
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
}
