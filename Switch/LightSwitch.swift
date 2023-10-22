//
//  LightSwitch.swift
//  Switch
//
//  Created by teona nemsadze on 22.10.23.
//

import SwiftUI

struct LightSwitch: View {
    let appWidth = UIScreen.main.bounds.width
    let appHeight = UIScreen.main.bounds.height
    let animationDuration: TimeInterval = 0.35
    
    @State var xScale: CGFloat = 2
    @State var yScale: CGFloat = 0.4
    @State var yOffset: CGFloat = UIScreen.main.bounds.height * 0.8
    @State var isOffset: Bool = true
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            Circle()
                .fill(Color.pink.opacity(0.5))
                .scaleEffect(CGSize(width: xScale, height: yScale))
                .offset(y: yOffset)
            VStack(alignment: .leading) {
                ZStack {
                    Capsule(style: .continuous)
                        .foregroundColor(.red)
                        .frame(width: 52,height: appHeight * 0.25 + 6)
                        .opacity(0.275)
                        .offset(x: appWidth / 2 - 48, y: 16)
                    ZStack {
                        Capsule()
                            .frame(width: 3, height: self.isOffset ? appHeight * 0.41 : appHeight * 0.625)
                            .foregroundColor(.black)
                        Capsule()
                            .fill(Color.black)
                            .frame(width: 42, height: 42)
                            .offset(y: self.isOffset ? appHeight * 0.225: appHeight * 0.25 + 42)
                            .onTapGesture {
                                toogleAllLight()
                            }
                    }.offset(x: appWidth / 2 - 48, y: -appHeight / 2)
                        .frame(height:0, alignment: .top)
                }
                .animation(Animation.spring(dampingFraction: 0.65).speed(1.25))
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
    func toogleAllLight() {
        if (isOffset) {
            withAnimation(Animation.easeIn(duration:
            animationDuration)) {
                xScale = 4
                yScale = 4
                yOffset = 0
            }
        } else {
            withAnimation(Animation.easeInOut(duration: animationDuration * 0.75)) {
                yScale = 0.4
                xScale = 2
                yOffset = UIScreen.main.bounds.height * 0.8
            }
        }
        isOffset.toggle()
    }
}

struct LightSwitch_Previews: PreviewProvider {
    static var previews: some View {
        LightSwitch()
    }
}
