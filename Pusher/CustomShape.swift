//
//  CustomShape.swift
//  Pusher
//
//  Created by 奚锐的Mac on 2020/8/9.
//  Copyright © 2020 奚锐的Mac. All rights reserved.
//

import Foundation
import SwiftUI
struct semicircle : Shape {

    var pct = 0.0

    func path(in rect: CGRect) -> Path {

        let end = 0.0
        var start: Double

       start = 180

        var p = Path()
       
       
     
        p.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                 radius: rect.size.width/2,
                 startAngle: Angle(degrees: start),
                 endAngle: Angle(degrees: end),
            clockwise: false)
        p.addLine(to: CGPoint(x:rect.minX,y:rect.midY ))
 

        return p
    }

    var animatableData: Double {
        get { return pct }
        set { pct = newValue }
    }
}
struct  Hexagon: Shape {

    var pct: Double

    func path(in rect: CGRect) -> Path {

        let end = pct * 360
        var start: Double

       start = 0

        var p = Path()
       
       
     
        p.addArc(center: CGPoint(x: rect.size.width/2, y: rect.size.width/2),
                 radius: rect.size.width/2,
                 startAngle: Angle(degrees: start),
                 endAngle: Angle(degrees: end),
            clockwise: false)
 

        return p
    }

    var animatableData: Double {
        get { return pct }
        set { pct = newValue }
    }
}


struct CustomShape_Previews: PreviewProvider {
    static var previews: some View {
        semicircle().foregroundColor(Color.black)
        
    }
}
