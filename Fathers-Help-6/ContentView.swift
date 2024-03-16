//
//  ContentView.swift
//  Fathers-Help-6
//
//  Created by Andrei Gorbunov on 14.03.2024.
//

import SwiftUI

struct CustomLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let width = proposal.replacingUnspecifiedDimensions().width
        let height = proposal.replacingUnspecifiedDimensions().height
        let subviewsCount = CGFloat(subviews.count)
        let viewHeight = height / subviewsCount
        let viewSize = CGSize(width: viewHeight, height: viewHeight)
        var positionX = bounds.minX
        var positionY = bounds.maxY
        
        subviews.forEach { subview in
            let position = CGPoint(x: positionX, y: positionY)
            subview.place(at: position, anchor: .bottomLeading, proposal: ProposedViewSize(viewSize))
            positionX += (width - viewHeight) / (subviewsCount - 1)
            positionY -= viewHeight
        }
    }
}

struct ContentView: View {
    private var count = 7
    @State var customMode = true
    
    var body: some View {
        let layout = customMode ? AnyLayout(HStackLayout()) : AnyLayout(CustomLayout())
        
        layout {
            ForEach(0..<count) { _ in
                RoundedRectangle(cornerRadius: 10)
                    .aspectRatio(1.0, contentMode: .fit)
                    .foregroundStyle(.blue)
            }
        }
        .onTapGesture {
            withAnimation() {
                customMode.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
