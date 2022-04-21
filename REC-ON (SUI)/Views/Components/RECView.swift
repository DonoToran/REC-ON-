//
//  RECView.swift
//  REC-ON (SUI)
//
//  Created by Dono on 4/15/22.
//

import SwiftUI

struct RECView: View {
    var namespace: Namespace.ID
    @Binding var show: Bool
    
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading, spacing: 12) {
                Text("Student Recreation Center")
                    .font(.title2.weight(.bold))
                    .matchedGeometryEffect(id: "title", in: namespace)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Total: 4".uppercased())
                    .font(.subheadline.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle", in: namespace)
                
                Text("Friends: 1".uppercased())
                    .font(.subheadline.weight(.semibold))
                    .matchedGeometryEffect(id: "text", in: namespace)
            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .blur(radius: 30)
                    .matchedGeometryEffect(id: "blur", in: namespace)
            )
            
        }
        .foregroundStyle(.white)
        .background(
            Image("RecCourts")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "image", in: namespace))
        .background(
            Color("Blue").matchedGeometryEffect(id: "background", in: namespace)
        )
        .mask(RoundedRectangle(cornerRadius: 30, style:
                                    .continuous)
                .matchedGeometryEffect(id: "mask", in: namespace)
        )
        .offset(y: 75)
        .frame(height: 250)
        .padding(20)
    }
}

struct RECView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        RECView(namespace: namespace, show: .constant(true))
    }
}
