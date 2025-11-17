

import SwiftUI

struct subHeaderView<Content: View>: View {
    
    let content: Content
    let background: Color
    let height: CGFloat
    
    init(background: Color = .white, height: CGFloat = 200, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.background = background
        self.height = height
    }
    
    var body: some View {
        VStack {
            content
        }
        .frame(height: height)
        .frame(maxWidth: .infinity)
        .background(background)
        .clipShape(
            headerbackground(bottomLeft: 25, bottomRight: 25)
        )
    }
}

struct headerbackground: Shape {
    var bottomLeft: CGFloat = 0
    var bottomRight: CGFloat = 0
    
    func path(in rect: CGRect) -> Path {
    
        let bl: CGFloat = bottomLeft
        let br: CGFloat = bottomRight
        
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - br))
        path.addQuadCurve(to: CGPoint(x: rect.maxX - br, y: rect.maxY), control: CGPoint(x: rect.maxX, y: rect.maxY))
                          
        path.addLine(to: CGPoint(x: rect.minX + bl, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.maxY - bl), control: CGPoint(x: rect.minX, y: rect.maxY))
        
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        
        return path
                          
    }
}
