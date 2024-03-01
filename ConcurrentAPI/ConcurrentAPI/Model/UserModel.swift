//
//  UserModel.swift
//  ConcurrentAPI
//
//  Created by Daniel Cazorro Frias  on 1/3/24.
//

import Foundation

// Este struct representa la respuesta que obtienes al solicitar la lista de usuarios.
// Contiene una propiedad 'users' que es una matriz de 'Names', cada uno de los cuales representa un usuario.
struct Users: Codable {
    let users: [Names]
}

// Este struct representa el nombre e ID de un usuario.
struct Names: Codable {
    let name: String
    let id: Int
}

// Este struct representa el nombre y apellido de un usuario.
struct Surnames: Codable {
    let name, surname: String
}

// Este struct representa el trabajo y la empresa de un usuario.
struct Job: Codable {
    let job, company: String
}

// Este struct representa el salario y los impuestos de un usuario.
struct Salary: Codable {
    let salary, tax: Int
    let formation: Double
}

// Este struct representa la nómina de un usuario, incluido su nombre, apellido, trabajo, empresa, salario y total.
struct Payroll: Codable {
    let name, surname, job, company: String
    let salary, total: Double
}
