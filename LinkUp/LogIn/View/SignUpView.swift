

import SwiftUI

struct SignUpView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var phone: String = ""
    
    @State var password: String = ""
    @State var comfirmPassword: String = ""
    
    @State private var isCheckBox: Bool = false
    
    @State private var isEffects: Bool = false
    
    var body: some View {
        ZStack {
            Color.pink.opacity(0.1)
                .ignoresSafeArea()
            
            ScrollView {
                VStack {
                    //                IconWelcom of SignUpView
                    iconSigupWelcome()
                    //                Title
                    Text("LinkUp")
                        .font(.system(size: 40) .bold())
                    //                Some info
                    Text("Create your account and start conecting with anyone")
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                    //                textfiled for fillout
                    Group {
                        HStack {
                            textInput(title: "First Name", fill: .normal, text: $firstName)
                            textInput(title: "Last Name", fill: .normal, text: $lastName)
                        }
                        textInput(title: "Phone", fill: .normal, text: $phone)
                        textInput(title: "Email", fill: .normal, text: $email)
                        
                        //                    Password
                        textInput(title: "Password", fill: .password, text: $password)
                        textInput(title: "Confirm Password", fill: .password, text: $comfirmPassword)
                    }
                    .scaleEffect(isEffects ? 1 : 0.5)
                    .padding(.vertical, 8)
                    
                    
                    //                Button to Sigup
                    Button {
                        print("Sign Up")
                    } label: {
                        Text("Sign Up")
                            .font(.headline)
                            .bold()
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(formisValid ? .pink.opacity(0.6) : .pink.opacity(0.2))
                            )
                            
                            .padding(.vertical)
                    }
                    .disabled(!formisValid)
                    .offset(x: isEffects ? 0 : UIScreen.main.bounds.width)
                    
                    HStack(alignment: .top) {
                        Button{
                            withAnimation(.spring()){
                                isCheckBox.toggle()
                            }
                        } label: {
                            Image(systemName: isCheckBox ? "checkmark.square.fill" : "square")
                                .foregroundColor( isCheckBox ? .pink : .gray)
                                .padding(.top, 2)
                        }
                        
                        Text(try! AttributedString(markdown: "I agree to the [Terms and Services](https://google.com) and [Privacy Policy](https://google.com)"))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    //                Choose another Signup method
                    withSigUp()
                        .padding()
                    
                    HStack{
                        Text("Already have an account?")
                            .font(.subheadline)
                        
                        Button {
                            dismiss()
                        }label: {
                            Text("Sign in")
                                .font(.subheadline)
                        }
                    }
                    .padding(.top, 16)
                    
                }
                .padding(.horizontal, 8)
            }
            .opacity(isEffects ? 1: 0)
            .animation(.easeInOut(duration: 1.8), value: isEffects)
            .onAppear{
                isEffects = true

            
        }
        }
    }
}

// Extension

extension SignUpView: AuthenticationForm {
    var formisValid: Bool {
        return !firstName.isEmpty
        && !lastName.isEmpty
        && !email.isEmpty
        && !password.isEmpty
        && !comfirmPassword.isEmpty
        && password == comfirmPassword
        && isCheckBox == true
    }
}

#Preview {
    SignUpView()
}
