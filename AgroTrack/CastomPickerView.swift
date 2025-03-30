//
//  CastomPickerView.swift
//  AgroTrack
//
//  Created by Эвелина Пенькова on 29.03.2025.
//

import SwiftUI

enum CategoryCourse: String, CaseIterable {
    case data = "Data"
    case reports = "Reports"
    case statistics = "Statistics"
    case recomendations = "Recomendations"
    
    var title: String {
        self.rawValue
    }
}

struct CustomPickerView: View {
    @Binding var isAddNewNotePresented: Bool
    var backgroundColor: Color
    @State private var selectedCategory: CategoryCourse = .data
    
    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(CategoryCourse.allCases, id: \.self) { category in
                            Text(category.title)
                                .font(.system(size: 21, weight: .regular))
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .foregroundStyle(selectedCategory == category ? Color.black : Color.white)
                                .background(selectedCategory == category ? backgroundColor : Color.black.opacity(0.4))
                                .cornerRadius(32)
                                .id(category)
                                .onTapGesture {
                                    withAnimation {
                                        selectedCategory = category
                                        proxy.scrollTo(category, anchor: .center)
                                    }
                                }
                        }
                    }
                    .padding()
                }
            }
            
            SelectedCategoryView(isAddNewNotePresented: $isAddNewNotePresented, selectedCategory: selectedCategory)
        }
    }
}

struct SelectedCategoryView: View {
    @Binding var isAddNewNotePresented: Bool

    let selectedCategory: CategoryCourse
    
    var body: some View {
        VStack {
            switch selectedCategory {
            case .data:
                BedDataView()
            case .reports:
                ReportsView(isAddNewNotePresented: $isAddNewNotePresented)
            case .statistics:
                StatisticsView()
            case .recomendations:
                RecomendationView()
            }
        }
    }
}
