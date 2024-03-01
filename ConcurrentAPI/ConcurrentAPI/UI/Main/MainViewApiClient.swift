//
//  MainViewApiClient.swift
//  ConcurrentAPI
//
//  Created by Daniel Cazorro Frias  on 1/3/24.
//

import Foundation

class MainViewApiClient {
    let baseURL = "https://mock-movilidad.vass.es/api/formacion/"
    
    // Método para obtener los nombres de los usuarios
    func getUsers(completion: @escaping (Users?, Error?) -> Void) {
        let url = URL(string: baseURL + "names")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            // Verificar si hay algún error al realizar la solicitud
            if let error = error {
                print("Error fetching user names: \(error.localizedDescription)")
                completion(nil, error)
                return
            }
            
            // Verificar si se recibió alguna respuesta del servidor
            guard let data = data else {
                print("No data received")
                completion(nil, nil)
                return
            }
            
            // Imprimir el tipo de datos recibidos
            print("Received data type: \(type(of: data))")
            
            // Imprimir la respuesta de la API antes de intentar decodificarla
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Response JSON: \(jsonString)")
            }
            
            // Intentar decodificar los datos recibidos
            do {
                let users = try JSONDecoder().decode(Users.self, from: data)
                completion(users, nil)
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
                completion(nil, error)
            }
        }.resume()
    }



    
    // Método para obtener el apellido de un usuario por su ID
    func getSurname(for userID: Int, completion: @escaping (Surname?, Error?) -> Void) {
        let url = URL(string: baseURL + "surname/\(userID)")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(nil, error)
                return
            }
            do {
                let surname = try JSONDecoder().decode(Surname.self, from: data)
                completion(surname, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
    
    // Método para obtener el trabajo de un usuario por su ID
    func getJob(for userID: Int, completion: @escaping (Job?, Error?) -> Void) {
        let url = URL(string: baseURL + "job/\(userID)")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(nil, error)
                return
            }
            do {
                let job = try JSONDecoder().decode(Job.self, from: data)
                completion(job, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
    
    // Método para obtener el salario de un usuario por su ID
    func getSalary(for userID: Int, completion: @escaping (Salary?, Error?) -> Void) {
        let url = URL(string: baseURL + "salary/\(userID)")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(nil, error)
                return
            }
            do {
                let salary = try JSONDecoder().decode(Salary.self, from: data)
                completion(salary, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
    
    // Método para obtener la nómina de un usuario por su ID
    func getPayroll(for userID: Int, completion: @escaping (Payroll?, Error?) -> Void) {
        let url = URL(string: baseURL + "payroll/\(userID)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completion(nil, error)
                return
            }
            do {
                let payroll = try JSONDecoder().decode(Payroll.self, from: data)
                completion(payroll, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}
