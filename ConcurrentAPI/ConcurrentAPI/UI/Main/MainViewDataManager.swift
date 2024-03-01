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
    
    func getUsers(completion: @escaping ([Names]?, Error?) -> Void) {
        apiClient.getUsers(completion: completion)
    }
    
    // Método para obtener el apellido de un usuario por su ID
    func getSurname(for userID: Int, completion: @escaping (Surnames?, Error?) -> Void) {
        apiClient.getSurname(for: userID, completion: completion)
    }
    
    // Método para obtener el trabajo de un usuario por su ID
    func getJob(for userID: Int, completion: @escaping (Job?, Error?) -> Void) {
        apiClient.getJob(for: userID, completion: completion)
    }
    
    // Método para obtener el salario de un usuario por su ID
    func getSalary(for userID: Int, completion: @escaping (Salary?, Error?) -> Void) {
        apiClient.getSalary(for: userID, completion: completion)
    }
    
    // Método para obtener la nómina de un usuario por su ID
    func getPayroll(for userID: Int, completion: @escaping (Payroll?, Error?) -> Void) {
        apiClient.getPayroll(for: userID, completion: completion)
    }
}
