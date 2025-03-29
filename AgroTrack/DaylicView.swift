//
//  DaylicView.swift
//  AgroTrack
//
//  Created by Эвелина Пенькова on 29.03.2025.
//

import SwiftUI

struct DaylicView: View {
    var body: some View {
        ZStack{
            Color.white.opacity(0.62)
           
            HStack{
                VStack(alignment: .leading){
                    Text("Beds ready for harvesting")
                        .font(.system(size: 12, weight: .medium))
                         .foregroundStyle(Color.black)
                }
                Spacer()
                Capsule()
                    .frame(width: 0.5, height: 146)
                    .foregroundStyle(Color.white)
                    .overlay(
                        Capsule()
                            .inset(by: -1)
                            .stroke(Color.white, lineWidth: 2)
                    )
                Spacer()
                VStack (alignment: .leading){
                    Text("Needs to be watered")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundStyle(Color.black)
                }
            }.padding()
                
            
        }
        .frame(maxHeight: 180)
        .cornerRadius(17)
    }
}

#Preview {
    DaylicView()
}
