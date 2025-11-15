//
//  ChatsView.swift
//  LinkUp
//
//  Created by Nguyen Khang on 12/11/25.
//

import SwiftUI

struct ChatsView: View {
    
    @State private var searchText: String = ""
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [Color.blue.opacity(0.1), Color.pink.opacity(0.1)], startPoint: .leading, endPoint: .trailing)
                    .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
//                    Infor current user
                    Group {
                        HStack {
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 32, height: 32)
                            
                            VStack(alignment: .leading){
                                Text("Some story")
                                    .font(.subheadline)
                                Text("Current username")
                                    .font(.title3)
                            }
                            
                            Spacer()
                            
                            Image(systemName: "rectangle.and.pencil.and.ellipsis")
                                .resizable()
                                .frame(width: 32, height: 32)
                        }
                        
//                        Search...
                        TextField("Search...", text: $searchText)
                            .padding(.horizontal)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.gray)
                            )
                    }
                    .padding(.horizontal)

//                    user activew
                    activeUser()
//                    Chat list
                    ForEach(0..<10){ user in
                        HStack {
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                        
                        VStack(alignment: .leading){
                            Text("userName")
                                .font(.subheadline)
                            Text("Content recent messages")
                                .font(.footnote)
                         }
                            
                            Spacer()
                            
                            VStack{
                                Text("time... >")
                                    .font(.footnote)
                            }
                        
                        }
                        .padding()
                    }
                    
                }
            }
        }
    }
}


#Preview {
    ChatsView()
}
