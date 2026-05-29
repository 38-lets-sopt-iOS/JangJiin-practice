//
//  LazyGridExampleView.swift
//  SOPT-38-SwiftUI
//
//  Created by 장지인 on 5/23/26.
//

import SwiftUI

struct LazyGridExampleView: View {
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(1...20, id: \.self) { value in
                    VStack {
                        Rectangle()
                            .foregroundStyle(.cyan)
                            .frame(height: 100)
                            .cornerRadius(10)
                        Text("아이템 \(value)")
                    }
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
                }
            }
            .padding(16)
        }
    }
}

private func emoji(_ value: Int) -> String {
    guard let scalar = UnicodeScalar(value) else { return "?" }
    return String(Character(scalar))
}
