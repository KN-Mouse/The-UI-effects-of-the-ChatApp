

import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                        //                    Header
                
                subHeaderView(background: .blue.opacity(0.8), height: 290){
                    VStack {
                        Spacer()
                        HStack {
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
                    .padding(.bottom, 12)
                    .padding(.horizontal)
                }
                
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
