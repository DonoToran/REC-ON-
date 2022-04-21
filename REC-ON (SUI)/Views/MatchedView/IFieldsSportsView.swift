//
//  IFieldsSportsView.swift
//  REC-ON (SUI)
//
//  Created by Dono on 4/15/22.
//

import SwiftUI

struct IFieldsSportsView: View {
    var namespace2: Namespace.ID
    @Binding var show2: Bool
    
    
    var body: some View {
        ZStack {
            Color("Blue").ignoresSafeArea()
            VStack(spacing: 150){
                cover2
                Button(action:{}, label: {
                    Text("Check-In")
                        .font(.body.weight(.semibold))
                        .foregroundColor(.white)
                })
                    .offset(y: -75)
            }
            Button {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                    show2.toggle()
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
    
    var cover2: some View{
            VStack{
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 550)
            .foregroundStyle(.white)
            .background(
                Image("IFields")
                    .resizable()
                    .edgesIgnoringSafeArea(.top)
                    .frame(width: 400, height: 250)
                    .matchedGeometryEffect(id: "image2", in: namespace2),
                alignment: .top
            )
        
            .background(
                Color("Blue").matchedGeometryEffect(id: "background2", in: namespace2)
            )
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .matchedGeometryEffect(id: "mask2", in: namespace2)
            )
            .overlay(
                VStack(alignment: .leading, spacing: 12) {
                    Text("Friends: 0".uppercased())
                        .font(.subheadline.weight(.semibold))
                        .matchedGeometryEffect(id: "text2", in: namespace2)
                    
                    Text("Total: 2".uppercased())
                        .font(.subheadline.weight(.semibold))
                        .matchedGeometryEffect(id: "subtitle2", in: namespace2)
                    
                    Text("Intramural Fields")
                        .font(.title2.weight(.bold))
                        .matchedGeometryEffect(id: "title2", in: namespace2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Divider()
                    VStack (alignment: .leading) {
                    
                        Text("🏐: 0")
                            .font(.system(size: 20))
                            
                    Divider()
                        
                        Text("⚽️: 2")
                            .font(.system(size: 20))
                        
                    Divider()
                        Text("🎾: 0")
                            .font(.system(size: 20))
                        
                    }
                }
                    .padding(20)
                    .background(
                        Rectangle()
                            .fill(.ultraThinMaterial)
                            .mask(RoundedRectangle(cornerRadius: 30,style: .continuous))
                            .matchedGeometryEffect(id: "blur2", in: namespace2)
                    )
                    .offset(y: 125)
                    .padding(20)
            )
    }
    
    
}
struct IFieldsSportsView_Previews: PreviewProvider {
    @Namespace static var namespace2
    static var previews: some View {
        IFieldsSportsView(namespace2: namespace2, show2: .constant(true))
    }
}
