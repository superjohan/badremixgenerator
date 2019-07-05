//
//  Export.swift
//  Bad Remix Generator
//
//  Created by Johan Halin on 05/07/2019.
//  Copyright © 2019 Aero Deko. All rights reserved.
//

import Foundation

func save(points: Array<CGPoint>, toFilename filename: String) {
    print("filename: \(filename), points: \(points.count)")
    
    var buffer = [UInt8]()
    
    func addPoint(_ point: CGPoint) {
        // x
        buffer.append(0)
        buffer.append(UInt8(point.x))
        buffer.append(0)
        buffer.append(0)
        
        // y
        buffer.append(0)
        buffer.append(UInt8(point.y))
        buffer.append(0)
        buffer.append(0)
    }
    
    for point in points.shuffled() {
        addPoint(point)
    }
    
    let byteCount = charCount * 8
    
    while buffer.count < byteCount {
        print("fixing a whoopsie daisy")
        
        addPoint(points.randomElement()!)
    }
    
    let data = Data(bytes: buffer, count: byteCount)
    try? data.write(to: URL(fileURLWithPath: "/Users/rm/\(filename)"))
}
