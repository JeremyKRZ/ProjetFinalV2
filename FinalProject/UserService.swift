//
//  UserService.swift
//  FinalProject
//
//  Created by etudiant on 22/09/2022.
//

import FirebaseFirestore

class UserService{
    
    let database = Firestore.firestore()
    var ref: DocumentReference? = nil
    
    func get(collectionID: String, handler: @escaping ([User]) -> Void) {
        database.collection("users")
            .addSnapshotListener { querySnapshot, err in
                if let error = err {
                    print(error)
                    handler([])
                } else {
                    handler(User.build(from: querySnapshot?.documents ?? []))
                }
            }
    }
    
    func set(collectionID: String, lastname: String, firstname: String){
        ref = database.collection("users").addDocument(data: [
            "lastname": lastname,
            "firstname": firstname
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(self.ref!.documentID)")
            }
        }
    }
}
