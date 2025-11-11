

import SwiftUI

struct SignInView: View {
    
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
                                .fill(formisValid ? .blue : .blue.opacity(0.2))
                        )
                        
                }
                .disabled(!formisValid)
                .offset(x: isEffects ? 0 : -UIScreen.main.bounds.width)
                //            Choose Signin with different
                
                withSigUp()
                    .padding()
                
                //            some infor add
                Spacer()
                HStack{
                    Text("Don't have an account?")
                    NavigationLink(destination: SignUpView()){
                        Text("Sign Up")
                    }
                }
                .padding(.bottom, 4)
                
               
                Text(try! AttributedString(markdown: "By Sigining in, you agree to our [Terms of Service](https://example.com) and [Privacy Policy](https://example.com)"))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
             
            }
            .opacity(isEffects ? 1 : 0)
            .animation(.easeInOut(duration: 1.8), value: isEffects)
            .onAppear{ isEffects = true }
            .padding()
        }
    }
}

//
extension SignInView: AuthenticationForm {
    var formisValid: Bool {
        return !email.isEmpty
        && !password.isEmpty
    }
}

#Preview {
    SignInView()
}
