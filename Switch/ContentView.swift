//
//  ContentView.swift
//  Switch
//
//  Created by teona nemsadze on 22.10.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            LightSwitch()
            TitleView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            Text("click and change")
                .font(.headline)
            Text("→ → → →")
            
                .font(.largeTitle)
        }
        .foregroundColor(.white)
    }
}
