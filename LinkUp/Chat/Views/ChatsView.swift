

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
                    
                    subHeaderView(background: .blue.opacity(0.8), height: 200){
                        VStack {
                            Spacer()
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
                                .background(.ultraThinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 20.0))
                            
                        }
                        .padding(.bottom, 12)
                        .padding(.horizontal)
                        
                    }
                    
                    
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
            .ignoresSafeArea()
        }
    }
}


#Preview {
    ChatsView()
}
