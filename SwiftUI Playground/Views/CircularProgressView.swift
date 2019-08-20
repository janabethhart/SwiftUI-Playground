//
//  CircularProgressView.swift
//  SwiftUI Playground
//
//  Created by Jana Hart on 8/20/19.
//  Copyright © 2019 Jana Hart. All rights reserved.
//

import SwiftUI

struct CircularProgressView: View {
    let progress: Double
    let thin: Bool
    
    var outerWidth: CGFloat { return thin ? 25.0 : 40.0 }
    var innerWidth: CGFloat { return thin ? 15.0 : 25.0 }
    
    var body: some View {
        ZStack
            {
                ProgressArc(progress: 1.0)
                    .stroke(Color.black,
                            style: StrokeStyle(
                                lineWidth: outerWidth,
                                lineCap: .round,
                                lineJoin: .round,
                                miterLimit: 0,
                                dash: [],
                                dashPhase: 0
                    ))
                
                ProgressArc(progress: progress)
                    .stroke(Color.red,
                            style: StrokeStyle(
                                lineWidth: innerWidth,
                                lineCap: .round,
                                lineJoin: .round,
                                miterLimit: 0,
                                dash: [],
                                dashPhase: 0
                    ))
        }
        .padding()
    }
}

struct ProgressArc: Shape
{
    let progress: Double
    
    func path(in rect: CGRect) -> Path
    {
        return Path { path in
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.width / 4,
                startAngle: Angle(degrees: -90),
                endAngle: Angle(degrees: (360 * progress) - 90),
                clockwise: false
            )
        }
    }
}

#if DEBUG
struct CircularProgressView_Previews: PreviewProvider {
    static let prog: Double = 0.68
    static var previews: some View {
        VStack {
            CircularProgressView(progress: prog, thin: false)
            CircularProgressView(progress: prog, thin: false).scaleEffect(x: 0.5, y: 0.5)
            CircularProgressView(progress: prog, thin: true).scaleEffect(x: 0.75, y: 0.75)
            CircularProgressView(progress: prog, thin: true).scaleEffect(x: 0.5, y: 0.5)
        }
    }
}
#endif
