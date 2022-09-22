//
//  UserFirebase.swift
//  FinalProject
//
//  Created by etudiant on 22/09/2022.
//

import FirebaseFirestore

extension User {
    static func build(from documents: [QueryDocumentSnapshot]) -> [User] {
        var users = [User]()
        for document in documents {
            users.append(User(lastname: document["lastname"] as? String ?? "",
                              firstname: document["firstname"] as? String ?? ""))
        }
        print(users)
        return users
    }
}
