//
//  ContentView.swift
//  NotesApp
//
//  Created by Justin Woodard on 6/15/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var login = LoginViewModel()
    
     var body: some View {
         if login.userLoggedOn {
             NotesView()
         } else {
             LoginView(login: login)
         }
     }
 }

#Preview {
    ContentView()
}
