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
