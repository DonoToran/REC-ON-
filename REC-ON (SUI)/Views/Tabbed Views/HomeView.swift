//
//  HomeView.swift
//  REC-ON (SUI)
//
//  Created by Miguel Tor on 3/30/22.
//

import SwiftUI

struct HomeView: View {
    @Namespace var namespace
    @Namespace var namespace2
    @State var show = false
    @State var show2 = false
    
    
    var body: some View {
        ZStack(alignment: .topLeading){
            Color("Yellow").ignoresSafeArea()
            VStack(spacing: 70){
                
                if !show {
                    RECView(namespace: namespace, show: $show)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                show.toggle()
                            }
                        }
                }
                
                if !show2 {
                    IFieldsView(namespace2: namespace2, show2: $show2)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                show2.toggle()
                            }
                        }
                }
            }
            .offset(y: 25)
            
            .overlay(
                NavigationBar(title: "Home")
            )
            
            if show {
                RECSportsView(namespace: namespace, show: $show)
            }
            
            if show2 {
                IFieldsSportsView(namespace2: namespace2, show2: $show2)
            }
        }
        
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
            
        }
    }
    
}
