//
//  main.swift
//  Bad Remix Generator
//
//  Created by Johan Halin on 05/07/2019.
//  Copyright © 2019 Aero Deko. All rights reserved.
//

import Foundation

let charCount = "Good artists copy, great artists steal. From Duchamp to Damien Hirst, artists have consistently challenged the idea that meaning ascribed to objects is permanently fixed. All cultural artifacts are open to re-appropriation. As with much else, technology has made this process easier and more visible.".replacingOccurrences(of: " ", with: "").count
let fullSize = CGSize(width: 256, height: 192)
let windowSize = CGSize(width: 176, height: 176)
let minX = (fullSize.width - windowSize.width) / 2.0
let maxX = minX + windowSize.width
let minY = (fullSize.height - windowSize.height) / 2.0
let maxY = minY + windowSize.height
let center = CGPoint(x: fullSize.width / 2.0, y: fullSize.height / 2.0)

save(points: rectangle(), toFilename: "rect1.bin")
save(points: rectangle(), toFilename: "rect2.bin")
