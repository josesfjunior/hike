//
//  CardView.swift
//  Hike
//
//  Created by José Júnior on 23/08/23.
//
import SwiftUI

struct CardView: View {
    //MARK: - PROPERTIES
    
    @State private var imageNumber:  Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    
    //MARK: - FUNCTIONS
    
    func randomImage(){
        randomNumber = Int.random(in: 1...5)
        if randomNumber == imageNumber {
            randomImage()
            return
        }
        imageNumber = randomNumber
    }
    var body: some View {
        //MARK: CARD
        ZStack {
            CustomBackgroundView()
            VStack {
                // MARK: - HEADER
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)
                            )
                        
                        Spacer()
                        
                        Button {
                            //ACTION: Show a Sheet
                            print("opaaaa")
                            
                            isShowingSheet.toggle()
                        }label:{
                            CustomButton()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        }
                    }
                    
                    Text("Fun and enjoyable outdoor activity for friends and families")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                } //: HEADER
                .padding(.horizontal, 30)
                
                //MARK: - MAIN CONTENT
                
                ZStack {
                    CustomCircleView()
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                }
                //MARK: - FOOTER
                Button{
                   randomImage()
                }label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(colors: [.customGreenLight, .customGreenMedium], startPoint: .top, endPoint: .bottom))
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y:2)
                }
                .buttonStyle(GradientButton())
            }
        } //: CARD
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
