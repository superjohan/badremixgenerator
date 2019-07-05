//
//  ShapeFunctions.swift
//  Bad Remix Generator
//
//  Created by Johan Halin on 05/07/2019.
//  Copyright © 2019 Aero Deko. All rights reserved.
//

import Foundation

func rectangle() -> Array<CGPoint> {
    let width = CGFloat.random(in: minX...maxX)
    let height = CGFloat.random(in: minY...maxY)
    let point1 = CGPoint(x: center.x - (width / 2.0), y: center.y - (height / 2.0))
    let point2 = CGPoint(x: center.x + (width / 2.0), y: center.y - (height / 2.0))
    let point3 = CGPoint(x: center.x + (width / 2.0), y: center.y + (height / 2.0))
    let point4 = CGPoint(x: center.x - (width / 2.0), y: center.y + (height / 2.0))
    
    return quad(point1, point2, point3, point4)
}

func quad(_ point1: CGPoint, _ point2: CGPoint, _ point3: CGPoint, _ point4: CGPoint) -> Array<CGPoint> {
    let p1p2d = hypot(point1.x - point2.x, point1.y - point2.y)
    let p2p3d = hypot(point2.x - point3.x, point2.y - point3.y)
    let p3p4d = hypot(point3.x - point4.x, point3.y - point4.y)
    let p4p1d = hypot(point4.x - point1.x, point4.y - point1.y)
    let totalLength = p1p2d + p2p3d + p3p4d + p4p1d
    let p1p2charCount = Int((p1p2d / totalLength) * CGFloat(charCount))
    let p2p3charCount = Int((p2p3d / totalLength) * CGFloat(charCount))
    let p3p4charCount = Int((p3p4d / totalLength) * CGFloat(charCount))
    let p4p1charCount = Int((p4p1d / totalLength) * CGFloat(charCount))
    
    let line1 = line(startPoint: point1, endPoint: point2, count: p1p2charCount)
    let line2 = line(startPoint: point2, endPoint: point3, count: p2p3charCount)
    let line3 = line(startPoint: point3, endPoint: point4, count: p3p4charCount)
    let line4 = line(startPoint: point4, endPoint: point1, count: p4p1charCount)
    
    return line1 + line2 + line3 + line4
}

func line(startPoint: CGPoint, endPoint: CGPoint, count: Int) -> Array<CGPoint> {
    var characters = [CGPoint]()
    
    for index in 0..<count {
        let position = CGFloat(index) / CGFloat(count)
        let point = CGPoint(
            x: ((endPoint.x - startPoint.x) * position) + startPoint.x,
            y: ((endPoint.y - startPoint.y) * position) + startPoint.y
        )
        
        characters.append(point)
    }
    
    return characters
}
