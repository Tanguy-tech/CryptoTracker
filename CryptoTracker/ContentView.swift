//
//  ContentView.swift
//  CryptoTracker
//
//  Created by Tanguy BILLON on 18/01/2021.
//

import SwiftUI

let LightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)

struct ContentView: View {
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
        VStack {
            WelcomeHeader()
            AppImage()
            UsernameField(username: $username)
            PasswordField(password: $password)
            Button(action:  {print("Button tapped")}) {
                LoginButton()
            }
        }
    .padding()
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
            .frame(width: 150, height:150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 20)
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
