//
//  StorageManager.swift
//  Insta
//
//  Created by Мария Елизарова on 29.09.2022.
//

import FirebaseStorage
import Foundation

final class StorageManager {
    static let shared = StorageManager()
    
    private init() {}
    
    private let storage = Storage.storage().reference()
    
    public func uploadProfilePicture(
        username: String,
        data: Data?,
        complition: @escaping (Bool) -> Void
    ) {
        guard let data = data else {
            return
        }
        storage.child("\(username)/profile_picture.png").putData(data, metadata: nil) { _, error in
            print("((((((")
            complition(error == nil)
        }
    }
}
