//
//  TitleRow.swift
//  REC-ON (SUI)
//
//  Created by Dono on 4/15/22.
//

//import SwiftUI
//
//struct TitleRow: View {
//    var imageURL = URL(string: "https://s.yimg.com/ny/api/res/1.2/hHZgk.1mMvQ.EH3xStOnzw--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTQ1MA--/https://s.yimg.com/uu/api/res/1.2/T_vEpe6icvx5s.DTv6ngiQ--~B/aD05MDA7dz0xMjgwO2FwcGlkPXl0YWNoeW9u/https://media.zenfs.com/en/hoops_hype_usa_today_sports_articles_974/400bfbb6a899b30a2a50124f567e7017")
//
//    var name = "Lebron James"
//    var body: some View {
//        HStack(spacing: 20) {
//            AsyncImage(url: imageURL) { image in
//                image.resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 50, height: 50)
//                    .cornerRadius(50)
//            }placeholder: {
//                ProgressView()
//            }
//
//            VStack(alignment: .leading) {
//                Text(name)
//                    .font(.title).bold()
//
//                Text("Online")
//                    .font(.caption)
//                    .foregroundColor(.gray)
//            }
//            .frame(maxWidth: .infinity, alignment: .leading)
//        }
//        .padding()
//    }
//}
//
//struct TitleRow_Previews: PreviewProvider {
//    static var previews: some View {
//        TitleRow()
//            .background(Color("Yellow"))
//    }
//}
