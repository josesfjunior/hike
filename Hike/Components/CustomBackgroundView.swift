//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by José Júnior on 23/08/23.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            
            //MARK: - 3. DEPTH
            
            Color.colorGreenDark
                .cornerRadius(40)
                .offset(y: 12)
            
            //MARK: - 2 LIGHT
            
            Color.colorGreenLight
                .cornerRadius(40)
                .offset(y: 3)
                .opacity(0.85)
            
            //MARK: -1. SURFACE

            LinearGradient(colors: [.customGreenLight, .customGreenMedium], startPoint: .top, endPoint: .bottom)
                .cornerRadius(40)
        }
        
    }
}

#Preview {
    CustomBackgroundView()
        .padding()
}
