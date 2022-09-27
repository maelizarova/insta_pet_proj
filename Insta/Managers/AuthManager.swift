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
    var result: Bool
    
    public var isSignIn: Bool {
        return auth.currentUser != nil
        
    }
    
    public func signIn(email: String, password: String, completion: @escaping (Result<User,>))
    
    public func signOut(completion: @escaping (Bool) -> Void) {
 
    }
}
