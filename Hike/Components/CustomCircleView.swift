//
//  CustomCircleView.swift
//  Hike
//
//  Created by José Júnior on 24/08/23.
//

import SwiftUI

struct CustomCircleView: View {
    
    @State private var isAnimateGradient: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [.customIndigoMedium, .customSalmonLight],
                        startPoint: isAnimateGradient ? .topLeading     : .bottomLeading,
                        endPoint:   isAnimateGradient ? .bottomTrailing : .topLeading)
                )
                .onAppear{
                    withAnimation(.linear(duration: 6.0).repeatForever(autoreverses: true)){
                        isAnimateGradient.toggle()
                    }
                }
            MotionAnimationView()
        } .frame(width: 256, height: 256)
        
    }
}

#Preview {
    CustomCircleView()
}
