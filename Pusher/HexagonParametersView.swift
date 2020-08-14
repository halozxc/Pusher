//
//  HexagonParametersView.swift
//  Pusher
//
//  Created by 奚锐的Mac on 2020/8/8.
//  Copyright © 2020 奚锐的Mac. All rights reserved.
//

import SwiftUI

struct HexagonParametersView: View {
    @State var gradientStart : Color
    @State var gradientEnd : Color
    var body: some View {
           GeometryReader { geometry in
                      Path { path in
                          var width: CGFloat = min(geometry.size.width, geometry.size.height)
                          let height: CGFloat = width
                        let xScale: CGFloat = 0.87
                          let xOffset: CGFloat = (width * (1.0 - xScale)) / 2.0
                          width *= xScale
                          
                          path.move(to: CGPoint(x: xOffset + width * 0.95,
                                                y: height * (0.2 + HexagonParameters.adjustment)))
                          HexagonParameters.points.forEach {p in
                              path.addLine(to:
                                  .init(x: xOffset + p.useWidth.0 * width * p.xFactors.0,
                                        y: p.useHeight.0 * height * p.yFactors.0)
                              )
                              path.addQuadCurve(to:
                                  .init(x: xOffset + width * p.useWidth.1 * p.xFactors.1,
                                        y: height * p.useHeight.1 * p.yFactors.1),
                                                control:
                                  .init(x: xOffset + width * p.useWidth.2 * p.xFactors.2,
                                        y: height * p.useHeight.2 * p.yFactors.2))
                          }
                      }
                      .fill(LinearGradient(gradient: Gradient(
                        colors: [self.gradientStart, self.gradientEnd]),
                                         startPoint: .topLeading,
                                         endPoint: .bottomTrailing)
            )
                          .aspectRatio(1, contentMode: .fit)
            
                  }
    }
}

struct HexagonParametersView_Previews: PreviewProvider {
    static var previews: some View {
        HexagonParametersView(gradientStart: Color.gray, gradientEnd: Color.black)
    }
}
struct HexagonParameters {
    struct Segment {
        let useWidth: (CGFloat, CGFloat, CGFloat)
        let xFactors: (CGFloat, CGFloat, CGFloat)
        let useHeight: (CGFloat, CGFloat, CGFloat)
        let yFactors: (CGFloat, CGFloat, CGFloat)
    }
    
    static let adjustment: CGFloat = 0.045
    
    static let points = [
        Segment(
            useWidth:  (1.00, 1.00, 1.00),
            xFactors:  (0.60, 0.40, 0.50),
            useHeight: (1.00, 1.00, 0.00),
            yFactors:  (0.05, 0.05, 0.00)
        ),
        Segment(
            useWidth:  (1.00, 1.00, 0.00),
            xFactors:  (0.05, 0.00, 0.00),
            useHeight: (1.00, 1.00, 1.00),
            yFactors:  (0.20 + adjustment, 0.30 + adjustment, 0.25 + adjustment)
        ),
        Segment(
            useWidth:  (1.00, 1.00, 0.00),
            xFactors:  (0.00, 0.05, 0.00),
            useHeight: (1.00, 1.00, 1.00),
            yFactors:  (0.70 - adjustment, 0.80 - adjustment, 0.75 - adjustment)
        ),
        Segment(
            useWidth:  (1.00, 1.00, 1.00),
            xFactors:  (0.40, 0.60, 0.50),
            useHeight: (1.00, 1.00, 1.00),
            yFactors:  (0.95, 0.95, 1.00)
        ),
        Segment(
            useWidth:  (1.00, 1.00, 1.00),
            xFactors:  (0.95, 1.00, 1.00),
            useHeight: (1.00, 1.00, 1.00),
            yFactors:  (0.80 - adjustment, 0.70 - adjustment, 0.75 - adjustment)
        ),
        Segment(
            useWidth:  (1.00, 1.00, 1.00),
            xFactors:  (1.00, 0.95, 1.00),
            useHeight: (1.00, 1.00, 1.00),
            yFactors:  (0.30 + adjustment, 0.20 + adjustment, 0.25 + adjustment)
        )
    ]
}
