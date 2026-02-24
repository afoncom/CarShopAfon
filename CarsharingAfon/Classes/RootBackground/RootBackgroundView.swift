//
//  RootBackgroundView.swift
//  CarsharingAfon
//
//  Created by afon.com on 23.02.2026.
//

import SwiftUI
 
struct RootBackgroundView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            Color.appBackground
                .ignoresSafeArea()

            content
        }
    }
}
