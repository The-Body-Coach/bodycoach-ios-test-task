//
//  ContentView.swift
//  BCTestTask
//
//  Created by Emilia Tothova on 21/02/2024.
//

import SwiftUI

struct MainView {
    @State private var pinnedContentHeight: CGFloat = 0

    func buttonAction() {
        print("Load data")
    }
}

extension MainView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                ScrollView {
                    VStack(spacing: 0) {
                        header
                        content
                            .padding(.bottom, pinnedContentHeight)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                            .background(contentBackground
                                .clipShape(TopSCurve())
                                .padding(.bottom, -geometry.safeAreaInsets.bottom))
                    }
                    .frame(
                        idealWidth: geometry.size.width,
                        maxWidth: geometry.size.width,
                        minHeight: geometry.size.height,
                        alignment: .top
                    )
                }
                .frame(width: geometry.size.width)
                
                pinned
                    .anchorBounds(key: "pinned-content")
            }
        }
        .background(Color.cobalt_500_white_0)
    }
    
    var header: some View {
        Text("The Body Coach\nTest Task")
            .foregroundStyle(Color.cobalt_50_550)
            .font(.largeTitle)
            .multilineTextAlignment(.center)
            .padding(.vertical, 32)
    }
    
    var content: some View {
        Text("Load Content Here")
            .font(.body)
            .padding(.top, 32)
            .foregroundStyle(Color.cobalt_500_white_0)
    }
    
    var contentBackground: some View {
        Color.cobalt_50_550
    }
    
    var pinned: some View {
        Button(action: buttonAction) {
            ButtonTitleView("Load Data")
        }
        .buttonStyle(CapsuleButtonStyle(.cobaltWhite))
        .comfortableReadingWidth()
        .padding(.horizontal, DesignConstants.gutterNarrow)
    }
}
