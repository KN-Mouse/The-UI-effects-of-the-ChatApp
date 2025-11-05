

import SwiftUI

struct textInput: View {
    
    enum typeField {
        case normal
        case password
    }
    
    let title: String
    let fill: typeField
    
    @Binding var text: String
    
    @State var isSecure: Bool = false     // hide password
    @FocusState var isFocus: Bool // animation title
    
    init(title: String = "", fill: typeField = .normal, text: Binding<String>){
        self.title = title
        self._text = text
        self.fill = fill
        self._isSecure = State(initialValue: fill == .password)
    }
    
    var body: some View {
        ZStack {
            HStack { // Title
                Text(title)
                    .foregroundColor(isFocus || !text.isEmpty ? .accentColor : .gray)
                    .font(.caption)
                    .scaleEffect(isFocus || !text.isEmpty ? 1.0 : 1.2)
                    .offset(y: isFocus || !text.isEmpty ? -35 : 0)
                    .animation(.easeInOut(duration: 0.35), value: isFocus || !text.isEmpty)
            }
            .padding(.leading, 18)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack{ // Fill out
                if fill == .password && isSecure {
                    SecureField("", text: $text )
                        .focused($isFocus)
                } else {
                    TextField("", text: $text)
                        .focused($isFocus)
                        .autocapitalization(.none)
                }
                
                if fill == .password {
                    Button {
                        isSecure.toggle()
                    } label: {
                        Image(systemName: isSecure ? "eye.slash" : "eye")
                    }
                }
            }
            .padding()
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isFocus ? Color.accentColor : Color.gray.opacity(0.5), lineWidth: 1)
            )
        }
    }
}

#Preview {
    textInput(title: "Email", fill: .normal, text: .constant(""))
        .padding()
    textInput(title: "Password", fill: .password, text: .constant(""))
        .padding()
}
