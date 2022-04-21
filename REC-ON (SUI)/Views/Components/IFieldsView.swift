//
//  IFieldsView.swift
//  REC-ON (SUI)
//
//  Created by Dono on 4/13/22.
//

import SwiftUI

struct IFieldsView: View {
    var namespace2: Namespace.ID
    @Binding var show2: Bool
    
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading, spacing: 12) {
                Text("Intramural Fields")
                    .font(.title2.weight(.bold))
                    .matchedGeometryEffect(id: "title", in: namespace2)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Total: 4".uppercased())
                    .font(.subheadline.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle", in: namespace2)
                
                Text("Friends: 1".uppercased())
                    .font(.subheadline.weight(.semibold))
                    .matchedGeometryEffect(id: "text", in: namespace2)
            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .blur(radius: 30)
                    .matchedGeometryEffect(id: "blur", in: namespace2)
            )
            
        }
        .foregroundStyle(.white)
        .background(
            Image("IFields")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "image", in: namespace2))
        .background(
            Color("Blue").matchedGeometryEffect(id: "background", in: namespace2)
        )
        .mask(RoundedRectangle(cornerRadius: 30, style:
                                    .continuous)
                .matchedGeometryEffect(id: "mask", in: namespace2)
        )
        //.offset(y: 150)
        .frame(height: 250)
        .padding(20)
    }
}

struct IFieldsView_Previews: PreviewProvider {
    @Namespace static var namespace2
    static var previews: some View {
        IFieldsView(namespace2: namespace2, show2: .constant(true))
    }
}
