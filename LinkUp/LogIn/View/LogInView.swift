

import SwiftUI

struct LogInView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    @State var isEffects: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                //            Effects Image
                iconWelcome()
                //            Infor Well come
                Text("Welcome back!")
                    .font(.largeTitle)
                    .bold()
                Text("Sign in to continue your conversations")
                    .padding(.bottom, 20)
                
                //            fiel email & password
                Spacer()
                
                Group{
                    textInput(title: "Email", fill: .normal, text: $email)
                    textInput(title: "Password", fill: .password, text: $password)
                }
                .padding(.top, 16)
                .opacity(isEffects ? 1 : 0)
                .scaleEffect(isEffects ? 1 : 0.5)
                
                
                
                //            text remember me - forgot password
                HStack {
                    Spacer()
                    Text("Forgot password?")
                        .foregroundColor(.blue)
                }
                .padding(.top, 6)
                //            Button -> Sign in
                Button {
                    print("Sign in")
                } label: {
                    Text("Sign In")
                        .font(.headline)
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                        )
                }
                .offset(x: isEffects ? 0 : -UIScreen.main.bounds.width)
                //            Choose Signin with different
                Text("- or continue with -")
                    .font(.default)
                    .foregroundColor(.gray)
                    .padding(.top, 20)
                
                withSigUp()
                
                //            some infor add
                Spacer()
                HStack{
                    Text("Don't have an account?")
                    NavigationLink(destination: EmptyView()){
                        Text("Sign Up")
                    }
                }
                
               
                Text("By Signing in, you agree to our")
                    .padding(.top, 8)
                HStack{
                    NavigationLink(destination: EmptyView()){
                        Text("Terms of Service")
                    }
                    Text("and")
                    NavigationLink(destination: EmptyView()){
                        Text("Privacy Policy")
                    }

                }
            }
            .opacity(isEffects ? 1 : 0)
            .animation(.easeInOut(duration: 1.8), value: isEffects)
            .onAppear{ isEffects = true }
            .padding()
        }
    }
}

#Preview {
    LogInView()
}
