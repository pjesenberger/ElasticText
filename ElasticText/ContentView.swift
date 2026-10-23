//
//  ContentView.swift
//  ElasticText
//
//  Created by Pascal Jesenberger on 12/02/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 28/255, green: 28/255, blue: 28/255).ignoresSafeArea()
            
            VStack(spacing: 82) {
                ElasticText(text: "PORTFOLIO")
                ElasticText(text: "EXPERIMENTS")
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    ContentView()
}
