//
//  MainViewWireframe.swift
//  ConcurrentAPI
//
//  Created by Daniel Cazorro Frias  on 1/3/24.
//

import UIKit

class MainViewWireframe {
    
    // MARK: - Properties
    var viewController: MainViewController {
        // Generating module components
        
        // Initialize the MainViewController
        let viewController: MainViewController = MainViewController()
        
        // Initialize the MainViewApiClient
        let apiClient: MainViewApiClient = MainViewApiClient()
        
        // Create the data manager and view model
        let dataManager: MainViewDataManager = createDataManager(with: apiClient)
        let viewModel: MainViewModel = createViewModel(with: dataManager)
        
        // Set the view model for the view controller
        viewController.set(viewModel: viewModel)
        return viewController
    }
    
    // MARK: - Private methods
    private func createDataManager(with apiClient: MainViewApiClient) -> MainViewDataManager{
        // Initialize the data manager with the MainViewApiClient
        MainViewDataManager(apiClient: MainViewApiClient())
    }
    
    private func createViewModel(with dataManager: MainViewDataManager) -> MainViewModel {
        // Initialize the view model with the data manager
        MainViewModel(dataManager: MainViewDataManager(apiClient: MainViewApiClient()))
    }
    
    // MARK: - Public methods
    
    /// Method to push the view controller onto the navigation stack
    func push(navigation: UINavigationController?) {
        guard let navigation = navigation else { return }
        
        // Push the view controller onto the navigation stack with animation
        navigation.pushViewController(viewController, animated: true)
    }
}
