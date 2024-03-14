//
//  ContentView.swift
//  Fathers-Help-6
//
//  Created by Andrei Gorbunov on 14.03.2024.
//

import SwiftUI

struct ContentView: View {
    private var count = 7
    
    var body: some View {
        HStack {
            ForEach(0..<count) { _ in
                RoundedRectangle(cornerRadius: 10)
                    .aspectRatio(1.0, contentMode: .fit)
                    .foregroundStyle(.blue)
            }
        }
        .ignoresSafeArea(edges: .horizontal)
    }
}

#Preview {
    ContentView()
}
