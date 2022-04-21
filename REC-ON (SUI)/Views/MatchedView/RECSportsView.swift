//
//  RECSportsView.swift
//  REC-ON (SUI)
//
//  Created by Dono on 4/13/22.
//

import SwiftUI

struct RECSportsView: View {
    var namespace: Namespace.ID
    @Binding var show: Bool
    
    
    var body: some View {
        ZStack {
            Color("Blue").ignoresSafeArea()
            
            VStack(spacing: 150){
                cover
                Button(action:{}, label: {
                    Text("Check-In")
                        .font(.body.weight(.semibold))
                        .foregroundColor(.white)
                    
                })
                    .offset(y:-50)
            }
            Button {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                    show.toggle()
                }
                
            }label: {
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundColor(.secondary)
                    .padding(8)
                    .background(.ultraThinMaterial, in: Circle())
            }
            .frame(maxWidth: .infinity, maxHeight: 700, alignment: .topTrailing)
            .padding(20)
        }
    }
    
    var cover: some View{
        VStack{
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 550)
        .foregroundStyle(.white)
        .background(
            Image("RecCourts")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .edgesIgnoringSafeArea(.top)
                .matchedGeometryEffect(id: "image", in: namespace),
            alignment: .top
        )
        .background(
            Color("Blue").matchedGeometryEffect(id: "background", in: namespace)
        )
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask", in: namespace)
        )
        .overlay(
            VStack(alignment: .leading, spacing: 12) {
                Text("Friends: 1".uppercased())
                    .font(.subheadline.weight(.semibold))
                    .matchedGeometryEffect(id: "text", in: namespace)
                
                Text("Total: 4".uppercased())
                    .font(.subheadline.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle", in: namespace)
                
                Text("Student Recreation Center")
                    .font(.title2.weight(.bold))
                    .matchedGeometryEffect(id: "title", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                VStack (alignment: .leading) {
                    //HStack{
                    Text("🏀: 2")
                        .font(.system(size: 20))
                    
                    //}
                    Divider()
                    
                    Text("🏐: 2")
                        .font(.system(size: 20))
                    
                    Divider()
                    Text("⚽️: 0")
                        .font(.system(size: 20))
                    
                    Divider()
                    Text("🏸: 0")
                        .font(.system(size: 20))
                }
            }
                .padding(20)
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .mask(RoundedRectangle(cornerRadius: 30,style: .continuous))
                        .matchedGeometryEffect(id: "blur", in: namespace)
                )
                .offset(y: 150)
                .padding(20)
        )
    }
    
    
}


struct RECSportsView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        RECSportsView(namespace: namespace, show: .constant(true))
    }
}
