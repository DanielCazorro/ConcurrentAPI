//
//  MainViewWireframe.swift
//  ConcurrentAPI
//
//  Created by Daniel Cazorro Frias  on 1/3/24.
//

import Foundation

class MainViewWireframe {
    
    // MARK: - Properties
    var viewController: MainViewController {
        // Generating module components
        let viewController: MainViewController = MainViewController()
        let apiClient: MainViewApiClient = MainViewApiClient()
        
        let dataManager: MainViewDataManager = createDataManager(with: apiClient)
        let viewModel: MainViewModel = createViewModel(with: dataManager)
        
        viewController.set(viewModel: viewModel)
        return viewController
    }
    
    // MARK: - Private methods
    private func createDataManager(with apiClient: MainViewApiClient) -> MainViewDataManager{
        MainViewDataManager(apiClient: MainViewApiClient())
    }
    
    private func createViewModel(with dataManager: MainViewDataManager) -> MainViewModel {
        MainViewModel(dataManager: MainViewDataManager(apiClient: MainViewApiClient()))
    }
}
