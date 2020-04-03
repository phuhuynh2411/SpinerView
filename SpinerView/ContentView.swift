//
//  ContentView.swift
//  SpinerView
//
//  Created by Huynh Tan Phu on 4/2/20.
//  Copyright © 2020 Filesoft. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var percentage: CGFloat = 1.0 // start from 0.0 to 1.0
    var body: some View {
        Spinner(percentage: $percentage)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Spinner: View {
    @Binding var percentage: CGFloat
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                ForEach(1...12, id: \.self) { i in
                    Rectangle()
                        .fill(Color.gray)
                        .cornerRadius(1)
                        .frame(width: proxy.frame(in: .local).width/12, height: proxy.frame(in: .local).height/4)
                        .opacity(self.percentage * 12 >= CGFloat(i) ? Double(i)/12 : 0)
                        .offset(y: -proxy.frame(in: .local).width/3)
                        .rotationEffect(.degrees(Double(30 * i)), anchor: .center)
                }
            }
        }.frame(width: 40, height: 40)
    }
}
