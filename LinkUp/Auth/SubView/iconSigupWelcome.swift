

import SwiftUI

struct iconSigupWelcome: View {
    @State var isUp: Bool = false
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .fill(
                    LinearGradient(colors: [Color.pink.opacity(0.8), Color.pink.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .frame(width: 100, height: 100)
            
            Image(systemName: "person.2.badge.plus")
                .resizable()
                .foregroundColor(.white)
                .frame(width: 55, height: 55)
        }
        .offset(y: isUp ? -10 : 10)
        .animation(
            Animation.easeIn(duration: 1.5).repeatForever(autoreverses: true), value: isUp
        )
        .onAppear{ isUp.toggle() }
    }
}

#Preview {
    iconSigupWelcome()
}
