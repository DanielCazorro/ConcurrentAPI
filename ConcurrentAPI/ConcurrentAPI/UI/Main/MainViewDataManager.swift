//
//  MainViewDataManager.swift
//  ConcurrentAPI
//
//  Created by Daniel Cazorro Frias  on 1/3/24.
//

import Foundation

class MainViewDataManager {
    
    // MARK: - Properties
    private var apiClient: MainViewApiClient
    
    // MARK: - Initializers
    init(apiClient: MainViewApiClient) {
        self.apiClient = apiClient
    }
}
