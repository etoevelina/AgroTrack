//
//  BedDataView.swift
//  AgroTrack
//
//  Created by Эвелина Пенькова on 29.03.2025.
//

import SwiftUI

struct BedDataView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                dataCard(title: "Planted by", description: "Penkova Evelina Sergeevna")
                
                HStack {
                    halfWidthCard(title: "Sowing date", description: Date().formatted(date: .numeric, time: .omitted))
                    halfWidthCard(title: "Harvest date", description: Date().formatted(date: .numeric, time: .omitted))
                }
                
                dataCard(title: "Substrate type:", description: "Coconut", height: 55)
                dataCard(title: "Left until harwing:", description: "30 days")
                dataCard(title: "Special conditions:", description: "30 days")
            }
            .padding()
        }
    }
}

private func dataCard(title: String, description: String, height: CGFloat = 90) -> some View {
    HStack {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 21, weight: .bold))
                .foregroundStyle(Color.black)
            Text(description)
                .font(.system(size: 21, weight: .regular))
                .foregroundStyle(Color.black.opacity(0.8))
        }
        Spacer()
    }
    .padding()
    .frame(maxWidth: .infinity, minHeight: height)
    .background(Color.white.opacity(0.7))
    .cornerRadius(19)
    .scrollTransition(.interactive, axis: .vertical){ view, phase in
        view.opacity(phase.value < 0  ? 0 : 1)
    }
}

private func halfWidthCard(title: String, description: String) -> some View {
    HStack {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 21, weight: .bold))
                .foregroundStyle(Color.black)
            Text(description)
                .font(.system(size: 21, weight: .regular))
                .foregroundStyle(Color.black.opacity(0.8))
        }
        Spacer()
    }
    .padding()
    .frame(maxWidth: UIScreen.main.bounds.width / 2, minHeight: 90)
    .background(Color.white.opacity(0.7))
    .cornerRadius(19)
    .scrollTransition(.interactive, axis: .vertical){ view, phase in
        view.opacity(phase.value < 0  ? 0 : 1)
    }
}

#Preview {
    BedDataView()
}
