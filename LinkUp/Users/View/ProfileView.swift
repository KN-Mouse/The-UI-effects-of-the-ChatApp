

import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                        //                    Header
                            ZStack{
                                VStack {
                                    HStack {
                                        Button {
                                            dismiss()
                                        } label: {
                                            Image(systemName: "chevron.backward.chevron.backward.dotted")
                                                .foregroundColor(.white)
                                        }
                                        
                                        Spacer()
                                        Text("Profile")
                                            .foregroundColor(.white)
                                        Spacer()
                                        NavigationLink(destination: EmptyView()){
                                            Image(systemName: "gearshape.2.fill")
                                                .foregroundColor(.white)
                                        }
                                        
                                    }
                                    .font(.title2)
                                    .frame(maxWidth: .infinity)
                                    
                                    //                    Information currentUser
                                    VStack {
                                        Image(systemName: "person.circle")
                                            .resizable()
                                            .frame(width: 128, height: 128)
                                        
                                        Text("Name of currentuser")
                                        Text("Number or email")
                                        
                                        
                                    }
                                }
                                .padding(.top, 30)
                               
                            }.padding(.horizontal)
                            .frame(height: 300)
                            .frame(maxWidth: .infinity)
                            .background(
                                LinearGradient(colors: [Color.blue, Color.blue.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .clipShape(
                                headerbackground(bottomLeft: 25, bottomRight: 25)
                            )
                           
                
                //                        Bio or status
                Text("Share something here (Bio or Status)")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray.opacity(0.5))
                    )
                    .padding()

                HStack {
                    //                            Foreach...
                    Button {
                        
                    } label: {
                        Text("Photos")
                            .frame(height: 55)
                            .padding(.horizontal)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray.opacity(0.5))
                            )
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Videos")
                            .frame(height: 55)
                            .padding(.horizontal)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray.opacity(0.5))
                            )
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Links")
                            .frame(height: 55)
                            .padding(.horizontal)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray.opacity(0.5))
                            )
                    }
                }

                      
                        
                        //                    Posts or stories
                        ForEach(0..<10) { _ in
                            VStack{
                                Text("Post")
                                    .font(.headline)
                                    .padding()
                                
                                Rectangle()
                                    .fill(.blue.opacity(0.3))
                                    .frame(height: 200)
                            }
                        }
                        Spacer()

            }
            .ignoresSafeArea(edges: .top)
        }
    }
}

#Preview {
    ProfileView()
}
