//
//  LoginView.swift
//  NotesApp
//
//  Created by Justin Woodard on 6/14/24.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    
    @State var login : LoginViewModel
    
    var body: some View {
        ZStack{
            Color.blue
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.orange, .white], startPoint: .center, endPoint: .bottomTrailing))
                .frame(width: 1000, height: 100)
                .rotationEffect(.degrees(-165))
                .offset(y: -450)
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.orange, .white], startPoint: .center, endPoint: .bottomTrailing))
                .frame(width: 1000, height: 100)
                .rotationEffect(.degrees(165))
                .offset(y: -300)
            VStack{
                Text("Login")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                
                Spacer()
                    .frame(height: 50)
                
                VStack {
                    Text("Email:")
                        .font(.system(size: 20, weight: .heavy, design: .rounded))
                    
                    TextField("", text: $login.user.email)
                        .font(.system(size: 20, weight: .heavy, design: .rounded))
                        .textFieldStyle(.plain)
                        .foregroundColor(.black)
                }
                .frame(alignment: .center)
                Rectangle()
                    .frame(width: 200, height: 1)
                
                Spacer()
                    .frame(height: 25)
                VStack {
                    Text("Password:")
                        .font(.system(size: 20, weight: .heavy, design: .rounded))
                    
                    SecureField("", text: $login.user.password)
                        .font(.system(size: 20, weight: .heavy, design: .rounded))
                        .textFieldStyle(.plain)
                        .foregroundColor(.black)
                }
                .frame(alignment: .center)
                Rectangle()
                    .frame(width: 200, height: 1)
                
                Spacer()
                    .frame(height: 100)
                
                Button {
                    login.register(email: login.user.email, password: login.user.password)
                } label: {
                    Text("Sign Up")
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 200, height: 40)
                        .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(.orange))
                }
                .padding(.top)
                
                VStack {
                    Text("Already have an account?")
                    Button {
                        login.login(email: login.user.email, password: login.user.password)
                    } label: {
                        Text("Login")
                            .bold()
                            .foregroundColor(.white)
                            .frame(width: 200, height: 40)
                            .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(.orange))
                    }
                }
                .padding(.top)
                .offset(y: 25)
                
            }
            .padding()
            .frame(width: 350)
            .foregroundColor(.white)
            .onAppear {
                
            }
        }
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(login: LoginViewModel())
    }
}
