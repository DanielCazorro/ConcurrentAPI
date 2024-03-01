//
//  MainViewController.swift
//  ConcurrentAPI
//
//  Created by Daniel Cazorro Frias  on 1/3/24.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: - Properties
    private var viewModel: MainViewModel?
    private var isLoading: Bool = true
    
    //MARK: - IBOutlets
    @IBOutlet weak var tvListOfPersons: UITableView!
    @IBOutlet weak var vwLoadingView: UIView!
    @IBOutlet weak var aiLoadingActivity: UIActivityIndicatorView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        showLoading()
        
        // Crear una instancia de MainViewModel y asignarla al viewModel
        let dataManager = MainViewDataManager(apiClient: MainViewApiClient())
        viewModel = MainViewModel(dataManager: dataManager)
        
        // Llamar al método para obtener los nombres de los usuarios
        viewModel?.getUsers { [weak self] users, error in
            guard let self = self else { return }
            if let error = error {
                print("Error fetching user names: \(error.localizedDescription)")
                return
            }
            
            if let users = users {
                // Imprimir los nombres de los usuarios por consola
                for name in users.names {
                    print("User Name: \(name.name)")
                }
            }
            
            // Ocultar la vista de carga
            self.isLoading = false
            self.showLoading()
        }
    }


    // MARK: - Functions
    func set(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    
    func showLoading() {
        if isLoading {
            vwLoadingView.isHidden = false
            aiLoadingActivity.startAnimating()
        } else {
            vwLoadingView.isHidden = true
            aiLoadingActivity.stopAnimating()
        }
    }
}
