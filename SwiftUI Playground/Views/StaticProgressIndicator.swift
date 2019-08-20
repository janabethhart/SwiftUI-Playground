//
//  StaticProgressIndicator.swift
//  SwiftUI Playground
//
//  Created by Jana Hart on 8/20/19.
//  Copyright © 2019 Jana Hart. All rights reserved.
//

import SwiftUI

enum TestTimes: Int
{
    case Small = 24
    case Medium = 37
    case Large = 52
    case Max = 60
}

struct StaticProgressIndicator: View {
    var body: some View {
        VStack {
            VerticalIndicator(name: "Time Used", value: TestTimes.Medium.rawValue)
            Spacer()
            HorizontalIndicator(name: "Time Used", value: TestTimes.Medium.rawValue)
        }
    }
}

struct VerticalIndicator: View {
    var name: String
    var value: Int
    
    var body: some View {
        VStack {
            Text(name.uppercased()).font(.custom("HelveticaNeue", size: 40.0))
            Spacer()
            ZStack {
                CircularProgressView(progress: Double(value) / Double(TestTimes.Max.rawValue), thin: false)
                Text("\(value)").font(.custom("HelveticaNeue", size: 100.0))
            }
        }
    }
}

struct HorizontalIndicator: View {
    var name: String
    var value: Int
    
    var body: some View {
        HStack {
            ZStack {
                CircularProgressView(progress: Double(value) / Double(TestTimes.Max.rawValue), thin: true)
                Text("\(value)").font(.custom("HelveticaNeue", size: 25.0))
            }
            Text(name).font(.custom("HelveticaNeue", size: 50.0))
        }
        .scaleEffect(x: 0.75, y: 0.75)
        .offset(CGSize(width: -60.0, height: 0))
    }
}

struct StaticProgressIndicator_Previews: PreviewProvider {
    static var previews: some View {
        StaticProgressIndicator()
    }
}
