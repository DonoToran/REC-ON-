//
//  LoginView.swift
//  REC-ON (SUI)
//
//  Created by Miguel Tor on 3/30/22.
//

import SwiftUI
//import Firebase
//import FirebaseAuth


struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    @State var maxCircleHeight: CGFloat = 0
    
    
    //init(){
   //     FirebaseApp.configure()
    //}
    
    var body: some View {
        NavigationView{
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
                    
                    Text("Sign In")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    //Letter Spacing
                        .kerning(1.9)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    //Email and Password
                    VStack(alignment: .leading, spacing: 8, content: {
                        
                        Text("Email")
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        
                        TextField("@Gmail", text: $email)
                        //Increasing font size and changing text color
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.black)
                            .padding(.top,5)
                        
                        Divider()
                    })
                        .padding(.top, 25)
                    
                    VStack(alignment: .leading, spacing: 8, content: {
                        
                        Text("Password")
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        
                        TextField("1234", text: $password)
                        //Increasing font size and changing text color
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.black)
                            .padding(.top,5)
                        
                        Divider()
                    })
                        .padding(.top, 20)
                    
                    //Forgot password
                    Button(action: {}, label: {
                        Text("Forgot Password?")
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                    })
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.top, 25)
                    
                    //Sign In button
                    Button(action: {}, label: {
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
                        .padding(.top, 10)
                }
                .padding()
                //Removing unwanted space
                .padding(.top, -maxCircleHeight / 1.6)
                .frame(maxHeight: .infinity, alignment: .top)
            }
            .overlay(
                
                HStack {
                    
                    Text("Not A Member?")
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                    NavigationLink(destination: SignUpView(), label: {
                        
                        Text("Sign Up")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("Blue"))
                    })
                    
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
        .navigationBarHidden(true)
    }
    
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


//Extending view to get Screen Size
extension View{
    
    func getRec()-> CGRect{
        
        return UIScreen.main.bounds
    }
    
    //Getting safe area
    func getSafeArea() -> UIEdgeInsets{
        return UIApplication.shared.windows.first?.safeAreaInsets
        ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
