//
//  FirebaseManager.swift
//  REC-ON (SUI)
//
//  Created by Dono on 4/26/22.
//

import Foundation
import Firebase

class FirebaseManager: NSObject {
    let auth: Auth
    let storage: Storage
    let firestore: Firestore
    
    static let shared = FirebaseManager()
    
    override init() {
        FirebaseApp.configure()
        
        self.auth = Auth.auth()
        self.storage = Storage.storage()
        self.firestore = Firestore.firestore()
        
        super .init()
    }
}
