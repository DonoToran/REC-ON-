//
//  SignUpView.swift
//  REC-ON (SUI)
//
//  Created by Miguel Tor on 3/30/22.
//

import SwiftUI

struct SignUpView: View {
    
    @State var name = ""
    @State var username = ""
    @State var email = ""
    @State var password = ""
    @State var maxCircleHeight: CGFloat = 0
    
   // @StateObject private var vm = SignUpViewModelImpl(
     //   service: SignUpServiceImpl()
   // )
    
    var body: some View {
        VStack{
            
            //Top Rings -- MaxHeight will be screen size
            //GeoReader bc other screens have different sizes
            GeometryReader{ proxy -> AnyView in
                
                let height = proxy.frame(in: .global).height
                
                DispatchQueue.main.async {
                    if maxCircleHeight == 0 {
                        maxCircleHeight = height
                    }
                }
                    return AnyView(
                        ZStack{
                            Circle()
                                .fill(Color("Blue"))
                                .offset(x: getRec().width / 2, y: -height / 1.3 )

                            Circle()
                                .fill(Color("Blue"))
                                .offset(x: -getRec().width / 2, y: -height / 1.5)
                            Circle()
                                .fill(Color("Yellow"))
                                .offset(y: -height / 1.3)
                                .rotationEffect(.init(degrees: -5))
                        }
                    )
                
            }
            .frame(maxHeight: getRec().width)
            
            VStack{
                
                Text("Sign Up")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    //Letter Spacing
                    .kerning(1.9)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                //Name and Username Email and Password
                VStack(alignment: .leading, spacing: 8, content: {
                    
                    
                    
                    TextField("Name", text: $name)
                    //Increasing font size and changing text color
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.black)
                        .padding(.top,5)
                
                    Divider()
                })
                    .padding(.top, 25)
                
                VStack(alignment: .leading, spacing: 8, content: {
                    
                    TextField("Username", text: $username)
                    //Increasing font size and changing text color
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.black)
                        .padding(.top,5)
                
                    Divider()
                })
                    .padding(.top, 25)
                
                VStack(alignment: .leading, spacing: 8, content: {
                
                    TextField("Email", text: $email)
                    //Increasing font size and changing text color
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.black)
                        .padding(.top,5)
                
                    Divider()
                })
                    .padding(.top, 25)
                
                VStack(alignment: .leading, spacing: 8, content: {
                    
                    
                    TextField("Password", text: $password)
                    //Increasing font size and changing text color
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.black)
                        .padding(.top,5)
                
                    Divider()
                })
                .padding(.top, 20)
                
                //vm.signUp() Button Action
                //Sign In button
                Button(action: {},
                       label: {
                    Image(systemName: "arrow.right")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color("Blue"))
                        .clipShape(Circle())
                    //Shadow for button
                        .shadow(color: .yellow.opacity(0.6),
                                radius: 5, x: 0, y: 0)
                })
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 25)
            }
            .padding()
            //Removing unwanted space
            .padding(.top, -maxCircleHeight / 1.6)
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .overlay(
            
            HStack {
                    
                Text("Already A Member?")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                NavigationLink(destination: LoginView(), label: {
                
                    Text("Sign In")
                        .fontWeight(.semibold)
                        .foregroundColor(Color("Blue"))
                })
                
                    .navigationBarHidden(true)
                    
            }
            
            ,alignment: .bottom
        )
        .background(
        
            //Bottom circles
            HStack{
                
                Circle()
                    .fill(Color("Blue"))
                    .frame(width: 70, height: 70)
                    .offset(x: -30, y: 0)
                
                Spacer(minLength: 0)
                
                Circle()
                    .fill(Color("Yellow"))
                    .frame(width: 110, height: 110)
                    .offset(x: 40, y: 20)
            }
                .offset(y: getSafeArea().bottom + 30)
            
            ,alignment: .bottom
        )
        
    }
}
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
