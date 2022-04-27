//
//  LoginView.swift
//  REC-ON (SUI)
//
//  Created by Miguel Tor on 3/30/22.
//

import SwiftUI
import Firebase


struct LoginView: View {
    
    let didCompleteLoginProcess: () -> ()
    
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    
    
    var body: some View {
        NavigationView {
            
            ZStack {
                
                Color("Yellow").edgesIgnoringSafeArea(.all)
                //.foregroundColor(Color("Blue"))
                
                ScrollView {
                    
                    Spacer()
                    VStack(spacing: 25) {
                        
                        VStack(spacing: 16) {
                            Spacer()
                            Spacer()
                            
                            //Username and Password
                            Group {
                                SuperTextField(
                                    placeholder: Text("Email").foregroundColor(Color("Blue")), text: $email
                                )
                                    .textContentType(.emailAddress)
                                    .keyboardType(.emailAddress)
                                    .autocapitalization(.none)
                                
                                
                                SuperSecureField (
                                    placeholder: Text("Password").foregroundColor(Color("Blue")), text: $password
                                )
                                
                            }
                            .padding(12)
                            .foregroundColor(.black)
                            .background(.white)
                            
                            
                            //Sign In button
                            Button(action: {
                                loginUser()
                                
                            }, label: {
                                Image(systemName: "arrow.right")
                                    .font(.system(size: 24, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color("Blue"))
                                    .clipShape(Circle())
                                //Shadow for button
                                    .shadow(color: .white.opacity(0.6),
                                            radius: 5, x: 0, y: 0)
                                
                            })
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical)
                                .padding(.top, 40)
                                .padding(.horizontal, 10)
                        }
                        .padding()
                        .padding(.bottom, 12)
                        
                        Text(self.errorMessage)
                            .foregroundColor(.red)
                    }
                    //Insert here
                    HStack {
                        
                        Text("Not A Member?")
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        
                        NavigationLink(destination: SignUpView(didCompleteSignUpProcess: {
                            
                        }), label: {
                            
                            Text("Sign Up")
                                .fontWeight(.semibold)
                                .foregroundColor(Color("Blue"))
                        })
                    
                    }
                    
                }
                
                
            }
            .navigationBarTitle("Log In")
        }
        
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func loginUser() {
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) {
            result, err in
            if let err = err {
                errorMessage = "Failed to login user: \(err)"
                return
            }
            
            print("Successfully logged in as user: \(result?.user.uid ?? "")")
            
            self.errorMessage = "Successfully logged in as user: \(result?.user.uid ?? "")"
            
            self.didCompleteLoginProcess()
        }
    }
    
    
    
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(didCompleteLoginProcess: {
            
        })
            
    }
}


struct SuperTextField: View {
    
    var placeholder: Text
    @Binding var text : String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
    
    
}


struct SuperSecureField: View {
    
    var placeholder: Text
    @Binding var text : String
    var commit: ()->() = { }
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            SecureField("", text: $text, onCommit: commit)
        }
    }
    
    
}
