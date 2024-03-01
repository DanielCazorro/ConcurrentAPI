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
    
    func getUsers(completion: @escaping ([Name]) -> Void) {
        dataManager.getUsers { users, _ in
            guard let users = users else { return }
            completion(users)
        }
    }
    
    func getUserDetail(userId: Int, completion: @escaping (Surname?, Job?, Salary?, Error?) -> Void) {
        let dispatchGroup = DispatchGroup()
        
        var userSurname: Surname?
        var userJob: Job?
        var userSalary: Salary?
        var error: Error?
        
        // Obtener apellido del usuario
        dispatchGroup.enter()
        dataManager.getSurname(for: userId) { surname, surnameError in
            if let surnameError = surnameError {
                error = surnameError
            } else {
                userSurname = surname
            }
            dispatchGroup.leave()
        }
        
        // Obtener trabajo del usuario
        dispatchGroup.enter()
        dataManager.getJob(for: userId) { job, jobError in
            if let jobError = jobError {
                error = jobError
            } else {
                userJob = job
            }
            dispatchGroup.leave()
        }
        
        // Obtener salario del usuario
        dispatchGroup.enter()
        dataManager.getSalary(for: userId) { salary, salaryError in
            if let salaryError = salaryError {
                error = salaryError
            } else {
                userSalary = salary
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            completion(userSurname, userJob, userSalary, error)
        }
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
    
    // Function to fetch payroll of a user by their ID
    func getPayroll(for userID: Int, completion: @escaping (Payroll?, Error?) -> Void) {
        dataManager.getPayroll(for: userID, completion: completion)
    }
}
