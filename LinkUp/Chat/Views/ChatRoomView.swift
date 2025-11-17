

import SwiftUI

struct ChatRoomView: View {
    @State var messText: String = ""
    var body: some View {
        VStack {
//            Header
            subHeaderView(background: .pink.opacity(0.5), height: 120){
                VStack{
                    Spacer()
                    HStack {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 22, weight: .medium))
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 48))
                        VStack(alignment: .leading){
                            Text("User Name")
                                .font(.system(size: 20, weight: .semibold))
                                .lineLimit(1)
                                .minimumScaleFactor(0.6)
                            Text("isActive")
                                .font(.footnote)
                        }
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "phone.circle.fill")
                                .foregroundColor(.black)
                                .font(.system(size: 30))
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "video.circle.fill")
                                .foregroundColor(.black)
                                .font(.system(size: 30))
                        }
                    }
                    
                }
                .padding(.horizontal)
                .padding(.bottom, 12)
            }
            
//            Content Chat
            ScrollView{
                ForEach(0..<5){_ in
                    Text("Content message")
                        .padding()
                }
            }
            
//            Footder
            
            HStack{
                Button{
                    
                }label: {
                    Image(systemName: "plus.app")
                        .font(.system(size: 30))
                }
                .padding(.trailing, 10)
                
                TextField("Type...", text: $messText)
                    .padding()
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                    )
                
                Button{
                    
                }label: {
                    Image(systemName: "paperplane.fill")
                        .font(.system(size: 30))
                }
                .padding(.leading, 10)
            }
            .padding()
            .frame(height: 60)
            .frame(maxWidth: .infinity)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ChatRoomView()
}
