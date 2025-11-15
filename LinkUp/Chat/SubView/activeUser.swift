//
//  activeUser.swift
//  LinkUp
//
//  Created by Nguyen Khang on 12/11/25.
//

import SwiftUI

struct activeUser: View {
    @State private var ishow: Bool = false
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<10){ user in
                        VStack{
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 64, height: 64)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                            Text("Some story")
                                .font(.footnote)
                        
                        }
                        .padding()
                }
            }
            
        }
    }
}

#Preview {
    activeUser()
}
