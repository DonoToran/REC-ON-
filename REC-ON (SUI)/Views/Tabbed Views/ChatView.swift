//
//  ChatView.swift
//  REC-ON (SUI)
//
//  Created by Dono on 4/15/22.
//

import SwiftUI

struct ChatView: View {
    
    let chatUser: ChatUser?
    
    var messageArray = ["Yooo, Let's Go Hoop!!", "I go back to LA tomorrow✈️", "This will be our only time ballin' together!!"]
    
    var body: some View {
        VStack {
            VStack {
                TitleRow(chatUser: self.chatUser)
                ScrollView{
                    ForEach(messageArray, id: \.self) { text in
                        MessageBubble(message: Message(id: "12345", text: text, received: true, timestamp: Date()))
                    
                    }
                    MessageBubble(message: Message(id: "2222", text: "I'll be there my guy!", received: false, timestamp: Date()))
                    
                }
                .padding(.top, 10)
                .background(.white)
                .cornerRadius(30, corners: [.topLeft, .topRight])
            }
            .background(Color("Yellow"))
            
            MessageField()
        }
    }
}


struct TitleRow: View {
    
    let chatUser: ChatUser?
    
    var imageURL = URL(string: "https://s.yimg.com/ny/api/res/1.2/hHZgk.1mMvQ.EH3xStOnzw--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTQ1MA--/https://s.yimg.com/uu/api/res/1.2/T_vEpe6icvx5s.DTv6ngiQ--~B/aD05MDA7dz0xMjgwO2FwcGlkPXl0YWNoeW9u/https://media.zenfs.com/en/hoops_hype_usa_today_sports_articles_974/400bfbb6a899b30a2a50124f567e7017")
    
    var name = "Lebron James"
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: imageURL) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
            }placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                Text(chatUser?.username ?? "")
                    .font(.title).bold()
                
                Text("Online")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
    }
}



struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        MessageList()
//        ChatView()
    }
}
