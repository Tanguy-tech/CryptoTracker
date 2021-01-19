//
//  ContentView.swift
//  CryptoTracker
//
//  Created by Tanguy BILLON on 18/01/2021.
//

import SwiftUI

let LightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)

let SavedUsername = "Tanguy"
let SavedPassword = "RugbyproTB-69"

struct ContentView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    @State var AuthentificationFailed: Bool = false //auth is false by default and become true if failed
    @State var AuthentificationSucced: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                WelcomeHeader()
                AppImage()
                UsernameField(username: $username)
                PasswordField(password: $password)
                if AuthentificationFailed {
                    Text("Informations incorrect. Try again.")
                        .foregroundColor(.red)
                }
                
                Button(action: {
                    if self.username == SavedUsername && self.password == SavedPassword {
                        self.AuthentificationSucced = true
                        self.AuthentificationFailed = false
                    } else {
                        self.AuthentificationFailed = true
                        self.AuthentificationSucced = false
                    }
                }) {
                    LoginButton()
                }
            }
        .padding()
        if AuthentificationSucced {
            Text("Login Succeeded!")
                .font(.subheadline)
                .frame(width: 200, height: 30)
                .background(Color.green)
                .cornerRadius(20)
                .animation(Animation.default)
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

struct WelcomeHeader: View {
    var body: some View {
        Text("Hello!\nWelcome to CryptoTracker")
            .font(.title)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .padding(.bottom, 20)
    }
}

struct AppImage: View {
    var body: some View {
        Image("AppLogo")
            .resizable()
            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            .frame(width: 140, height:140)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 50)
    }
}

struct LoginButton: View {
    var body: some View {
        Text("Login")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color(red: 24/255, green: 17/255, blue: 90/255))
            .cornerRadius(35.0)
    }
}

struct UsernameField: View {
    @Binding var username: String
    
    var body: some View {
        TextField("Username", text: $username)
            .padding()
            .background(LightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}

struct PasswordField: View {
    @Binding var password: String
    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(LightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}
