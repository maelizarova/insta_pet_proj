//
//  AuthManager.swift
//  Insta
//
//  Created by Мария Елизарова on 29.09.2022.
//

import FirebaseAuth
import Foundation

final class AuthManager {
    static let shared = AuthManager()
    
    private init() {}
    
    let auth = Auth.auth()
    
    enum AuthError: Error {
        case newUserCreation
    }
    
    public var isSignIn: Bool {
        try! auth.signOut()
        return auth.currentUser != nil
    }
    
    public func signIn(
        email: String,
        password: String,
        completion: @escaping (Result<User,Error>) -> Void) {
        
    }
    
    public func signUp(
        email: String,
        username: String,
        password: String,
        profilePicture: Data?,
        completion: @escaping (Result<User,Error>) -> Void
    ) {
        let newUser = User(username: username, email: email)
        // Create account
        auth.createUser(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                completion(.failure(AuthError.newUserCreation))
                return
            }
            DatabaseManager.shared.createUser(newUser: newUser) {success in
                if success {
                    StorageManager.shared.uploadProfilePicture(
                        username: username,
                        data: profilePicture
                    ) { uploadSuccess in
                        if uploadSuccess {
                            completion(.success(newUser))
                        }
                        else {
                            completion(.failure(AuthError.newUserCreation))
                        }
                    }
                }
                else {
                    completion(.failure(AuthError.newUserCreation))
                }
            }
        }
    }
    
    public func signOut(completion: @escaping (Bool) -> Void) {
 
    }
}
