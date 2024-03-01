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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    // MARK: - Functions
    func set(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }

}
