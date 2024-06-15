//
//  LoginViewModel.swift
//  NotesApp
//
//  Created by Justin Woodard on 6/15/24.
//

import Foundation
import FirebaseAuth

class LoginViewModel : ObservableObject {
    
    @Published var user = LoginModel(email: "", password: "")
    @Published private(set) var userLoggedOn = false
    
    func login(email:String, password: String) {
        Auth.auth().signIn(withEmail: user.email, password: user.password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                self.checkState()
            }
        }
    }
    
    func register(email:String, password: String) {
        Auth.auth().createUser(withEmail: user.email, password: user.password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                self.checkState()
            }
        }
    }
    
    func toggleUser() {
        userLoggedOn.toggle()
    }
    
    func checkState() {
        Auth.auth().addStateDidChangeListener { auth, user in
            if user != nil {
            }
        }
        
        if Auth.auth().currentUser != nil {
          // User is signed in.
            toggleUser()
        } else {
          // No user is signed in.
          // ...
        }
    }
    
    func setEmail(email: String) {
        self.user.email = email
    }
    
    func setPassword(password: String) {
        self.user.password = password
    }
}
