//
//  ContentView.swift
//  emanatLoginPage
//
//  Created by Ayxan Seferli on 22.05.22.
//

import SwiftUI

struct ContentView: View {
    
    @State var email = ""
    @State var password = ""
    @State var isLoggedIn = false
    @State var showAlert = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Image("login")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 200, alignment: .center)
                
                
                Text("Login")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                
                
                HStack(spacing: 15) {
                    Image(systemName: "mail.stack")
                        .foregroundColor(.gray)
                    VStack {
                        TextField("Email", text: $email)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                        Divider()
                    }
                }
                
                HStack(spacing: 15) {
                    Image(systemName: "lock")
                        .foregroundColor(.gray)
                    VStack {
                        SecureField("Password", text: $password)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                        Divider()
                    }
                }
                
                Button {
                    
                    if email == "emanat@emanat.az" && password == "password123" {
                        isLoggedIn = true
                    }
                    
                    showAlert.toggle()
                } label: {
                    Text("Login")
                        .font(.system(size: 18, weight: .semibold, design: .rounded ))
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .frame(width: 300, alignment: .center)
                        .background(.blue)
                        .cornerRadius(15)
                }.alert("Login State", isPresented: $showAlert, presenting: isLoggedIn) { file in
                    
                    Button(role: .cancel) {
                        email = ""
                        password = ""
                        isLoggedIn = false
                    } label: {
                        Text("Go Back")
                    }

                    
                } message: { file in
                    if file {
                        Text("Login successful 🤪")
                    } else {
                        Text("Login fail 😞")
                    }
                }
                
                Spacer()
                
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
