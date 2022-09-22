//
//  ApiResults.swift
//  TestAPIProject
//
//  Created by Nicolas Davenne on 22/09/2022.
//

import Foundation

struct ApiResults: Decodable {
    
    var results: [ApiUser]
    
}

struct ApiUser: Decodable {
    var gender: String
    var name: Name
    var location: Location
    var email: String
    var nat: String
    var phone: String
    var cell: String
    var dob: Birth
    var picture: Picture
}

struct Name: Decodable {
    var title: String
    var first: String
    var last: String
}

struct Location: Decodable {
    var street: Street
    var city: String
    var state: String
    var country: String
}

struct Street: Decodable {
    var number: Int
    var name: String
}

struct Birth: Decodable {
    var date: String
    var age: Int
}

struct Picture: Decodable
{
    var large: String
    var medium: String
    var thumbnail: String
}

