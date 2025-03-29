//
//  AuthorizationView.swift
//  AgroTrack
//
//  Created by Эвелина Пенькова on 29.03.2025.
//

import SwiftUI

struct AuthorizationView: View {
    @State var login = ""
    @State var password = ""
    var body: some View {
        ZStack{
            Color(red: 0.97, green: 0.96, blue: 0.9).ignoresSafeArea()
            VStack(alignment: .leading){
//                Text("AgroTrack")
//                    .font(.system(size: 37, weight: .bold))
//                    .foregroundStyle(Color.black)
//                    .padding(.bottom, 15)
                Image("auth")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 545)
                Text("Login:")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundStyle(Color.black)
                TextField("", text: $login)
                    .foregroundStyle(Color.black)
                    .frame(width: 258, height: 45)
                    .background(Color(red: 0.83, green: 0.89, blue: 0.65))
                    .cornerRadius(7)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black.opacity(0.2), lineWidth: 1)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black.opacity(0.5), lineWidth: 4)
                            .blur(radius: 4)
                            .offset(y: 4)
                            .mask(RoundedRectangle(cornerRadius: 10).fill(Color.black.opacity(0.6)))
                    )
                Text("Password:")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundStyle(Color.black)
                TextField("", text: $password)
                    .foregroundStyle(Color.black)
                    .frame(width: 258, height: 45)
                    .background(Color(red: 0.83, green: 0.89, blue: 0.65))
                    .cornerRadius(7)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black.opacity(0.2), lineWidth: 1)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black.opacity(0.5), lineWidth: 4)
                            .blur(radius: 4)
                            .offset(y: 4)
                            .mask(RoundedRectangle(cornerRadius: 10).fill(Color.black.opacity(0.6)))
                    )
                Button{
                    
                } label: {
                    Text("Sign in")
                        .font(.system(size: 23, weight: .semibold))
                        .foregroundStyle(Color.black)
                        .frame(width: 138, height: 50)
                        .background(Color(red: 0.83, green: 0.89, blue: 0.65))
                        .cornerRadius(28)
                        .shadow(color: Color(red: 0, green: 0, blue: 0).opacity(0.25), radius: 2, x: 0, y: 4)
                }
                .padding(.top, 20)

                    
                
                    
            }
            
            
        }
    }
}

#Preview {
    AuthorizationView()
}
