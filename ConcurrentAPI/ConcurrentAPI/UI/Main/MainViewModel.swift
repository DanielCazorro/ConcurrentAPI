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
    
    func getUsers(completion: @escaping ([Name]?, Error?) -> Void) {
        dataManager.getUsers(completion: completion)
    }
    
    // Método para obtener el apellido de un usuario por su ID
    func getSurname(for userID: Int, completion: @escaping (Surname?, Error?) -> Void) {
        dataManager.getSurname(for: userID, completion: completion)
    }
    
    // Método para obtener el trabajo de un usuario por su ID
    func getJob(for userID: Int, completion: @escaping (Job?, Error?) -> Void) {
        dataManager.getJob(for: userID, completion: completion)
    }
    
    // Método para obtener el salario de un usuario por su ID
    func getSalary(for userID: Int, completion: @escaping (Salary?, Error?) -> Void) {
        dataManager.getSalary(for: userID, completion: completion)
    }
    
    // Método para obtener la nómina de un usuario por su ID
    func getPayroll(for userID: Int, completion: @escaping (Payroll?, Error?) -> Void) {
        dataManager.getPayroll(for: userID, completion: completion)
    }
}
