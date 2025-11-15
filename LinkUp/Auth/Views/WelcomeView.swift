

import SwiftUI

struct WelcomeView: View {
    @State private var isEffect: Bool = false
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [Color.blue.opacity(0.2), Color.pink.opacity(0.2)], startPoint: .leading, endPoint: .trailing)
                    .ignoresSafeArea()
                
                VStack {
                    //                 icon effects
                    iconWelcome()
                        .padding(.top, 20)
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
                    Spacer()
                    //                SignIn or SignUP
                    NavigationLink(destination: SignInView()){
                        Text("Sign in")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(
                                        LinearGradient(colors: [Color.blue, Color.blue.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing)
                                    )
                                
                                
                            )
                    }
                    NavigationLink(destination: SignUpView()){
                        Text("Create an account")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.white)
                            )
                        
                    }
                    Spacer()
                    //                withSignup?
                    withSigUp()
                    
                    //                Infor terms off app
                    Text(try! AttributedString(markdown: "By continuing, you agree to our [Terms of Service](https://example.com) and [Privacy Policy](https://example.com)"))
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                }
                .padding()
            }
            }
        .opacity(isEffect ? 1 : 0)
        .animation(.easeInOut(duration: 2), value: isEffect)
        .onAppear{
            isEffect = true
        }
    }
}

#Preview {
    WelcomeView()
}
