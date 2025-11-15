

import SwiftUI

struct introIcon: View {
    
//    let icons = ["Fast", "Freely", "Secure"]
    let icons: [(name: String, color: Color)] = [("Fast", .blue.opacity(0.3)),("Secure", .green.opacity(0.3)), ("Simple", .purple.opacity(0.3))]
    
    @State private var ishow = false
    
    var body: some View {
        HStack(spacing: 30){
            ForEach(Array(icons.enumerated()), id: \.offset){ index, icon in
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(icon.color)
                            Image(icon.name)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                }
                    .frame(width: 65,height: 65)
                    
                    Text(icon.name)
                }
                .opacity(ishow ? 1 : 0)
                .offset(x: ishow ? 0 : 200)
                .animation(.easeInOut(duration: 0.5)
                               .delay(Double(index) * 0.5),
                               value: ishow)
            }
        }
        .onAppear{
            ishow = true
        }
    }
}

#Preview {
    introIcon()
}
