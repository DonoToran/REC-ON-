//
//  SignUpView.swift
//  REC-ON (SUI)
//
//  Created by Miguel Tor on 3/30/22.
//

import SwiftUI
import WebKit

struct SignUpView: View {
    
    let didCompleteSignUpProcess: () -> ()
    
    @State var username = ""
    @State var email = ""
    @State var password = ""
    @State var image: UIImage?
    @State var shouldShowImagePicker = false
    @State var errorMessage = ""
    
    
    
    var body: some View {
        ZStack {
            
            Color("Yellow").edgesIgnoringSafeArea(.all)
                .navigationTitle("Sign Up")
                .foregroundColor(.black)
            
            ScrollView {
                
                Spacer()
                Spacer()
                
                VStack(spacing: 16) {
                    
                    //User Image
                    Button(action: {
                        shouldShowImagePicker.toggle()
                    },
                           label: {
                        VStack {
                            if let image = self.image {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 128, height: 128)
                                    .cornerRadius(64)
                            } else {
                                Image(systemName: "person.fill")
                                    .foregroundColor(Color("Blue"))
                                    .font(.system(size: 64))
                                    .padding()
                            }
                        }
                        .overlay(RoundedRectangle(cornerRadius: 64)
                                    .stroke(Color("Blue"), lineWidth: 3))
                        
                    })
                        .padding(.bottom)
                    
                    
                    //Username and Password
                    Group {
                        //Username
                        SuperTextField(
                            placeholder: Text("Username").foregroundColor(Color("Blue")), text: $username
                        )
                            .autocapitalization(.none)
                        
                        //Email
                        SuperTextField(
                            placeholder: Text("Email").foregroundColor(Color("Blue")), text: $email
                        )
                            .textContentType(.emailAddress)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        
                        
                        //Password
                        SuperSecureField (
                            placeholder: Text("Password").foregroundColor(Color("Blue")), text: $password
                        )
                    }
                    .padding(12)
                    .foregroundColor(.black)
                    .background(.white)
                    
                    
                    //Sign In button
                    Button(action: {
                        createNewAccount()
                    }, label: {
                        Image(systemName: "arrow.right")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("Blue"))
                            .clipShape(Circle())
                        //Shadow for button
                        
                    })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical)
                        .padding(.top, 40)
                        .padding(.horizontal, 10)
                    
                    Text(self.errorMessage)
                        .foregroundColor(.red)
                }
                
                .padding()
                
            }
        }
        .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
            ImagePicker(image: $image)
        }
    }
    
    
    private func createNewAccount() {
        if self.image == nil {
            self.errorMessage = "You must select an avatar image"
            return
        }
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) {
            result, err in
            if let err = err {
                self.errorMessage = "Failed to create user: \(err)"
                return
            }
            
            print("Sucessfully created user: \(result?.user.uid ?? "")")
            self.errorMessage = "Sucessfully created user: \(result?.user.uid ?? "")"
            
            self.persistImageToStorage()
        }
    }
    
    
    private func persistImageToStorage() {
        //        let filename = UUID().uuidString
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid
        else { return }
        
        let ref = FirebaseManager.shared.storage.reference(withPath: uid)
        
        guard let imageData = self.image?.jpegData(compressionQuality: 0.5) else { return
            
        }
        
        ref.putData(imageData, metadata: nil) { metadata, err in
            if let err = err {
                self.errorMessage = "Failed to push image to Storage: \(err)"
                return
            }
            
            ref.downloadURL { url, err in
                if let err = err {
                    self.errorMessage = "Failed to retreive downloadURL \(err)"
                    return
                }
                self.errorMessage = "Successfully stored image with url: \(url?.absoluteString ?? "")"
                print(url?.absoluteString)
                
                guard let url = url else { return }
                self.storeUserInfo(imageProfileUrl:url)
            }
        }
    }
    
    private func storeUserInfo(imageProfileUrl: URL) {
        
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid
        else { return }
        
        let userData = ["username": self.username, "email": self.email, "uid": uid, "profileImageUrl": imageProfileUrl.absoluteString]
        
        FirebaseManager.shared.firestore.collection("users")
            .document(uid).setData(userData) { err in
                if let err = err {
                    print(err)
                    self.errorMessage = "\(err)"
                    return
                }
                
                print("Success")
                
                self.didCompleteSignUpProcess()
            }
        
    }
    
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(didCompleteSignUpProcess: {
            
        })
            .previewInterfaceOrientation(.portrait)
    }
}


