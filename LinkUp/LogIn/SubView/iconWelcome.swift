

import SwiftUI

struct iconWelcome: View {
    @State var isUp: Bool = false
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .fill(
                    LinearGradient(colors: [Color.blue, Color.blue.opacity(0.8)], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .frame(width: 100, height: 100)
            
            Image(systemName: "ellipsis.message.fill")
                .resizable()
                .foregroundColor(.white)
                .frame(width: 50, height: 40)
        }
        .offset(y: isUp ? -10 : 10)
        .animation(
            Animation.easeIn(duration: 1.5).repeatForever(autoreverses: true), value: isUp
        )
        .onAppear{ isUp.toggle() }
    }
}

#Preview {
    iconWelcome()
}
