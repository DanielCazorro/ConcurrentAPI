//
//  MainViewModel.swift
//  ConcurrentAPI
//
//  Created by Daniel Cazorro Frias  on 1/3/24.
//

import Foundation

class MainViewModel {
    
    // MARK: - Properties
    private var dataManager: MainViewDataManager
    
    // MARK: - Initializers
    init(dataManager: MainViewDataManager) {
        self.dataManager = dataManager
    }
}
