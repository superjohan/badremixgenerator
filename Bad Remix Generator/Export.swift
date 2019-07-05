//
//  Export.swift
//  Bad Remix Generator
//
//  Created by Johan Halin on 05/07/2019.
//  Copyright © 2019 Aero Deko. All rights reserved.
//

import Foundation

func save(points: Array<CGPoint>, toFilename filename: String) {
    print("points: \(points.count)")
    
    var buffer = [UInt8]()
    
    for point in points {
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
    
    let data = Data(bytes: buffer, count: charCount * 8)
    try? data.write(to: URL(fileURLWithPath: "/Users/rm/\(filename)"))
}
