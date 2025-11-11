

import SwiftUI

struct withSigUp: View {
    let icons = ["gmail_icon", "apple_icon", "facebook_icon"]
    
    var body: some View {
        
        VStack {
            Text("-- With Sign Up --")
                .foregroundColor(.gray)
            HStack(spacing: 16){
                ForEach(icons, id: \.self){ icon in
                    Button {
                        print("\(icon) tapped")
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.white)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                            
                            Image(icon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }
                    }
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    withSigUp()
}
