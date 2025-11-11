//
//  WelcomeView.swift
//  LinkUp
//
//  Created by Nguyen Khang on 10/11/25.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.blue.opacity(0.2), Color.pink.opacity(0.2)], startPoint: .leading, endPoint: .trailing)
                .ignoresSafeArea()
            
            VStack {
//                 icon effects
                iconWelcome()
//                Information of app
                
                Group {
                    Text("Welcome to LinkUp")
                        .font(Font.largeTitle.bold())
                    Text("Connect with world")
                    Text("Share moments, stay close, chat freely")
                }
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                
                introIcon()
                    .padding()
//                SignIn or SignUP
                NavigationLink(destination: SignInView()){
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(
                            LinearGradient(colors: [Color.blue.opacity(0.9), Color.blue.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        .frame(height: 55)
                }
                NavigationLink(destination: SignUpView()){
                    
                }
//                withSignup?
                withSigUp()
//                Infor terms off app
                Spacer()
            }
        }
    }
}

#Preview {
    WelcomeView()
}
