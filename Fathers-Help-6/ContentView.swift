//
//  ContentView.swift
//  Fathers-Help-6
//
//  Created by Andrei Gorbunov on 14.03.2024.
//

import SwiftUI

struct DiagonalLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let count = subviews.count
        let height = bounds.height / CGFloat(count)
        let wStep = (bounds.width - height) / CGFloat(count - 1)
        
        for (index, view) in subviews.enumerated() {
            view.place(
                at: .init(
                    x: CGFloat(index) * wStep + bounds.minX,
                    y: (bounds.maxY - height) - (height * CGFloat(index))),
                proposal: .init(
                    width: height,
                    height: height)
            )
        }
    }
}

struct ContentView: View {
    @State private var horizontal = true
    
    var body: some View {
        let layout = horizontal ? AnyLayout(HStackLayout()) : AnyLayout(DiagonalLayout())
        
        layout {
            ForEach(0..<7) { _ in
                RoundedRectangle(cornerRadius: 10)
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(.blue)
            }
        }
        .onTapGesture {
            withAnimation() {
                horizontal.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
