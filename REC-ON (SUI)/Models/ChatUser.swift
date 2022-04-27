//
//  ChatUser.swift
//  REC-ON (SUI)
//
//  Created by Dono on 4/26/22.
//

import Foundation

struct ChatUser: Identifiable {
    
    var id: String { uid }
    
    let uid, username, email, profileImageUrl: String
    
    init(data: [String: Any]) {
        self.uid = data["uid"] as? String ?? ""
        self.username = data["username"] as? String ?? ""
        self.email = data["email"] as? String ?? ""
        self.profileImageUrl = data["profileImageUrl"] as? String ?? ""
    }
}
