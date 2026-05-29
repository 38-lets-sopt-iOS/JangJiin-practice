//
//  ProfileView.swift
//  SOPT-38-SwiftUI
//
//  Created by 장지인 on 5/16/26.
//
import SwiftUI

struct ProfileView: View {
    var body: some View {
        HStack {
            Image(.image2)
                .resizable()
                .frame(width: 30, height: 30)
                .clipShape(Circle())
            
            VStack(alignment: .leading){
                HStack{
                    Text("이나연")
                        .bold()
                    Text("청파동")
                        .foregroundColor(.gray)
                }
                Text("냐냐냐냐냐냐냐")
            }
            
            Spacer()
            
            Image(.image2)
                .resizable()
                .frame(width: 20, height: 20)
        }
        .padding(60)
        .background(.white)
    }
}

#Preview {
    ProfileView()
}
