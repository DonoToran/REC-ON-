//
//  ProfileView.swift
//  REC-ON (SUI)
//
//  Created by Dono on 4/25/22.
//

import SwiftUI
import Firebase

struct ProfileView: View {
    
    @State var shouldShowLogOutOption = false
    
    @ObservedObject private var vm = MessageListViewModel()
    
    var body: some View {
        Button(action: {
            shouldShowLogOutOption.toggle()
        },
               label: {
                   HStack {
                       Spacer()
                       Text("Log Out")
                           .font(.system(size: 25, weight: .heavy))
                       Spacer()
                   }
                   .foregroundColor(.white)
                   .padding(.vertical)
                   .background(.red)
                        .cornerRadius(32)
                        .padding(.horizontal)
                        .shadow(radius: 15)
                   
               })
            .actionSheet(isPresented: $shouldShowLogOutOption) {
                .init(title: Text("Settings"), message: Text("Are you sure you want to logout?"), buttons: [
                    .destructive(Text("Log Out"), action: {
                        print("handle logging off")
                        vm.handleSignOut()
                    }),
                    .cancel()
                ])
            }
        
            .fullScreenCover(isPresented: $vm.isUserCurrentlyLoggedOut, onDismiss: nil) {
                LoginView(didCompleteLoginProcess: {
                    self.vm.isUserCurrentlyLoggedOut = false
                    self.vm.fetchCurrentUser()
                })
            }
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
