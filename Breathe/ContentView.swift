//
//  ContentView.swift
//  Breathe
//
//  Created by Nigel Gee on 29/02/2020.
//  Copyright © 2020 Nigel Gee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var radius: CGFloat = 140
    @State private var rotate: Double = 1
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            Circle()
                .frame(width: 25)
                .foregroundColor(.blue)
            
            ForEach(0..<6) { petal in
                Circle()
                    .frame(width: self.radius)
                    .offset(CGSize(width: 0, height: -self.radius / 2 + 15))
                    .rotationEffect(Angle(radians: .pi / 3 * Double(petal) + self.rotate))
                    .foregroundColor(.blue)
                    .opacity(0.4)
            }
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 3).repeatForever()) {
                    self.radius = 15
                    self.rotate += 1
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
