//
//  DatabaseManager.swift
//  Insta
//
//  Created by Мария Елизарова on 29.09.2022.
//

import FirebaseFirestore
import Foundation

final class DatabaseManager {
    static let shared = DatabaseManager()
    
    private init() {}
    
    let databse = Firestore.firestore()
    
    public func findUser(with email: String, completion: @escaping (User?) -> Void) {
        let ref = databse.collection("users")
        ref.getDocuments { snapshot, error in
            guard let users = snapshot?.documents.compactMap({User(with: $0.data()) }),
                  error == nil else {
                completion(nil)
                return
            }
            let user = users.first(where: {$0.email == email})
            completion(user)
        }
    }
    
    public func createUser(newUser: User, complition: @escaping (Bool) -> Void) {
        // Create a reference to a specific document
        let reference = databse.document("users/\(newUser.username)")
        //everything is a dictionary
        guard let data = newUser.asDictionary() else {
            complition(false)
            return
        }
        reference.setData(data) { error in
            complition(error == nil)
        }
    }
}
