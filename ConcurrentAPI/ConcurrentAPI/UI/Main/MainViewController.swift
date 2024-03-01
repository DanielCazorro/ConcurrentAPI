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
