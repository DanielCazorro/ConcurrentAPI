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
    let names: [Name]
}

// Modelo para representar un nombre de usuario
struct Name: Codable {
    let name: String
    let id: Int
}

// Modelo para representar un apellido de usuario
struct Surname: Codable {
    let name: String
    let surname: String
}

// Modelo para representar el trabajo de un usuario
struct Job: Codable {
    let job: String
    let company: String
}

// Modelo para representar el salario de un usuario
struct Salary: Codable {
    let salary: Double
    let tax: Int
    let formation: Double
}

// Modelo para representar la nómina de un usuario
struct Payroll: Codable {
    let name: String
    let surname: String
    let job: String
    let company: String
    let salary: Double
    let total: Double
}
