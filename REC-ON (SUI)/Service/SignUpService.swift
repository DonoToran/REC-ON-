//
//  SignUpService.swift
//  REC-ON (SUI)
//
//  Created by Miguel Tor on 4/5/22.
//

/*import Combine
import Foundation
import FirebaseDatabase
import FirebaseAuth

enum SignUpKeys: String {
    case name
    case username
    case email
}


protocol SignUpService {
    func signUp(with details: SignUpDetails) -> AnyPublisher<Void, Error>
}

final class SignUpServiceImpl: SignUpService {
    
    func signUp(with details: SignUpDetails) -> AnyPublisher<Void, Error> {
        
        Deferred {
            
            Future { promise in
                
                Auth.auth()
                    .createUser(withEmail: details.email,
                                password: details.password) { res, error in
                        
                        if let err = error {
                            promise(.failure(err))
                        } else {
                            
                            if let uid = res?.user.uid {
                                
                                let values = [SignUpKeys.name.rawValue: details.name,
                                              SignUpKeys.username.rawValue: details.username,
                                              SignUpKeys.email.rawValue: details.email] as [String: Any]
                                
                                Database.database()
                                    .reference()
                                    .child("users")
                                    .child(uid)
                                    .updateChildValues(values) { error, ref in
                                        
                                        if let err = error {
                                            promise(.failure(err))
                                        } else {
                                            promise(.success(()))
                                        }
                                    }
                            } else {
                                promise(.failure(NSError(domain: "Invalid User ID", code: 0, userInfo: nil)))
                            }
                        }
                    }
                
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
    
}*/
