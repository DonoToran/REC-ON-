//
//  MessageList.swift
//  REC-ON (SUI)
//
//  Created by Dono on 4/21/22.
//

import SwiftUI
import SDWebImageSwiftUI


class MessageListViewModel: ObservableObject {
    
    @Published var errorMessage = ""
    @Published var chatUser: ChatUser?
    
    init() {
        
        DispatchQueue.main.async {
            self.isUserCurrentlyLoggedOut = FirebaseManager.shared.auth.currentUser?.uid == nil
        }
        
        fetchCurrentUser()
    }
    
    func fetchCurrentUser() {
        
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid
        else {
            self.errorMessage = "Could not fine firebase uid"
            return
            
        }
        
        FirebaseManager.shared.firestore.collection("users").document(uid).getDocument { snapshot, error in
            if let error = error {
                self.errorMessage = "Failed to fetch current user: \(error)"
                print("Failed to fetch current user:", error)
                return
            }
            
            guard let data = snapshot?.data() else {
                self.errorMessage = "No data found"
                return
            }
            
            self.chatUser = .init(data: data)
        }
    }
    
    @Published var isUserCurrentlyLoggedOut = false
    
    func handleSignOut() {
        isUserCurrentlyLoggedOut.toggle()
        try? FirebaseManager.shared.auth.signOut()
    }
}



struct MessageList: View {
    
    @State var shouldNavigateToChatLog = false
    
    @ObservedObject private var vm = MessageListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
//               Text("CURRENT USER ID: \(vm.chatUser?.uid ?? "")")
                
                //custom nav bar
                customNavBar
                messageView
                
                NavigationLink("", isActive: $shouldNavigateToChatLog) {
                    ChatView(chatUser: self.chatUser)
                }
            }
            .overlay(
                newMessageButton, alignment: .bottom)
            .navigationBarHidden(true)
        }
    }
    
    private var customNavBar: some View {
        HStack(spacing: 16) {
            
            WebImage(url: URL(string: vm.chatUser?.profileImageUrl ?? ""))
                .resizable()
                .frame(width: 50, height: 50)
                .clipped()
                .cornerRadius(50)
                .overlay(
                    RoundedRectangle(cornerRadius: 44)
                        .stroke(Color.black, lineWidth: 2)
                )
                .shadow(radius: 5)
            
            
            VStack(alignment: .leading, spacing: 4) {
                Text("\(vm.chatUser?.username ?? "")")
                    .font(.system(size: 24, weight: .bold))
                
                HStack {
                    Circle()
                        .foregroundColor(.green)
                        .frame(width: 14, height: 14)
                    Text("online")
                        .font(.system(size: 12))
                        .foregroundColor(Color(.lightGray))
                }
            }
            
            Spacer()
            NavigationLink(destination: ProfileView(),
                           label: {
                Image(systemName: "gear")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.black)
            })
        }
        .padding()
    }
    
    
    private var messageView: some View {
        ScrollView {
            ForEach(0..<10, id: \.self) { num in
                VStack {
                    NavigationLink {
                        Text("Destination")
                    } label: {
                        HStack {
                            Image(systemName: "person.fill")
                                .font(.system(size: 32))
                                .padding(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 44)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                            
                            VStack(alignment: .leading) {
                                Text("Username")
                                    .font(.system(size: 16, weight: .bold))
                                
                                Text("Message sent to user")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color(.lightGray))
                            }
                            Spacer()
                            Text("22d")
                                .font(.system(size: 14, weight: .semibold))
                        }
                    }
                    Divider()
                        .padding(.vertical, 8)
                }.padding(.horizontal)
                
            }
            .padding(.top)
            .padding(.bottom, 50)
            
        }
    }
    
    @State var shouldShowNewMessageScreen = false
    
    
    private var newMessageButton: some View {
        Button(action: {
            shouldShowNewMessageScreen.toggle()
        },
               label: {
            HStack {
                Spacer()
                Text("+ New Message")
                    .font(.system(size: 16, weight: .bold))
                Spacer()
            }
            .foregroundColor(.white)
            .padding(.vertical)
            .background(Color("Blue"))
            .cornerRadius(32)
            .padding(.horizontal)
            .shadow(radius: 15)
            
        })
            .fullScreenCover(isPresented: $shouldShowNewMessageScreen) {
                NewMessageView(didSelectNewUser: { user in
                    print(user.username)
                    self.shouldNavigateToChatLog.toggle()
                    self.chatUser = user
                })
            }
    }
    
    @State var chatUser: ChatUser?
}


struct MessageList_Previews: PreviewProvider {
    static var previews: some View {
        MessageList()
            .keyboardType(/*@START_MENU_TOKEN@*/.default/*@END_MENU_TOKEN@*/)
    }
}
