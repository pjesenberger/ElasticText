//
//  ElasticText.swift
//  ElasticText
//
//  Created by Pascal Jesenberger on 12/02/2026.
//

import SwiftUI

struct ElasticText: View {
    let text: String
    var fontSize: CGFloat = 48
    var spacing: CGFloat = 30
    var maxBend: CGFloat = 60
    
    @State private var bend: CGFloat = 0
    
    private var width: CGFloat { CGFloat(text.count - 1) * spacing }
    
    var body: some View {
        ZStack {
            ForEach(Array(text.enumerated()), id: \.offset) { index, character in
                let t = CGFloat(index + 1) / CGFloat(text.count + 1)
                let y = 4 * bend * t * (1 - t)
                let slope = 4 * bend * (1 - 2 * t) / (CGFloat(text.count + 1) * spacing)
                
                Text(String(character))
                    .font(.system(size: fontSize, weight: .bold, design: .monospaced))
                    .rotationEffect(.radians(atan(slope)))
                    .offset(x: CGFloat(index) * spacing - width / 2, y: y)
            }
        }
        .frame(width: width + spacing, height: fontSize * 1.5)
        .contentShape(Rectangle())
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { value in
                    bend = max(-maxBend, min(value.translation.height * 0.6, maxBend))
                }
                .onEnded { _ in
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.3)) {
                        bend = 0
                    }
                }
        )
    }
}
