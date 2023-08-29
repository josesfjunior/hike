//
//  CustomListRowView.swift
//  Hike
//
//  Created by José Júnior on 28/08/23.
//

import SwiftUI

struct CustomListRowView: View {
    //MARK: - PROPERTIES
    
    @State var rowLabel           : String
    @State var rowIcon            : String
    @State var rowContent         : String? = nil
    @State var rowTintColor       : Color
    @State var rowLinkLabel       : String? = nil
    @State var rowLinkDestination : String? = nil
    
    
    
    var body: some View {
        LabeledContent {
            if rowContent != nil && rowLinkLabel == nil && rowLinkDestination == nil {
                Text(rowContent!)
                    .foregroundColor(.primary)
                    .fontWeight(.heavy)
            }
            
            if rowContent == nil && rowLinkLabel != nil && rowLinkDestination != nil{
              Link(rowLinkLabel!, destination: URL(string: rowLinkDestination!)!)
                    .foregroundColor(.pink)
                    .fontWeight(.heavy)
            }
            
            if rowContent == nil && rowLinkLabel == nil && rowLinkDestination == nil{
                EmptyView()
            }
        } label: {
            HStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                
                Text(rowLabel)
            }
        }
    }
}

#Preview {
    List {
        CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "Hike", rowTintColor: .blue)
    }
}
