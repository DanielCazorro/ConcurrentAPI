//
//  MainViewController.swift
//  ConcurrentAPI
//
//  Created by Daniel Cazorro Frias  on 1/3/24.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    private var viewModel: MainViewModel?
    private var isLoading: Bool = false
    private var names: [String] = []
    
    // MARK: - IBOutlets
    @IBOutlet weak var tvListOfPersons: UITableView!
    @IBOutlet weak var vwLoadingView: UIView!
    @IBOutlet weak var aiLoadingActivity: UIActivityIndicatorView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        showLoading()
        
        configureTableView()
        
        // Crear una instancia de MainViewModel y asignarla al viewModel
        let dataManager = MainViewDataManager(apiClient: MainViewApiClient())
        viewModel = MainViewModel(dataManager: dataManager)
        
        // Call the method to get user names
        viewModel?.getUsers { [weak self] names in
            guard let self = self else { return }
            
            // Update names array
            self.names = names.map { $0.name }
            
            // Print the list of user names
            print("List of user names:")
            for name in self.names {
                print("- \(name)")
            }
            
            // Reload table view data on the main thread
            DispatchQueue.main.async {
                self.tvListOfPersons.reloadData()
            }
            
            // Hide loading view
            self.isLoading = false
            self.showLoading()
        }
    }
    
    // MARK: - Functions
    func set(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    
    func configureTableView() {
        // Configure table view
        tvListOfPersons.dataSource = self
        tvListOfPersons.delegate = self
        tvListOfPersons.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
    }
    
    func showLoading() {
        DispatchQueue.main.async {
            self.vwLoadingView.isHidden = !self.isLoading
            self.isLoading ? self.aiLoadingActivity.startAnimating() : self.aiLoadingActivity.stopAnimating()
        }
    }
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle row selection if needed
    }
}
