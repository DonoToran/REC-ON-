//
//  ChatView.swift
//  REC-ON (SUI)
//
//  Created by Dono on 4/15/22.
//

import SwiftUI

struct ChatView: View {
    var messageArray = ["Yooo, Let's Go Hoop!!", "I go back to LA tomorrow✈️", "This will be our only time ballin' together!!"]
    
    var body: some View {
        VStack {
            VStack {
                TitleRow()
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

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
