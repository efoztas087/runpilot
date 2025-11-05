//
//  Run.swift
//  runpilot
//
//  Created by Efe Oztas on 30/10/2025.
//

import Foundation
import CoreLocation

struct Run: Identifiable, Codable {
    let id: UUID = UUID()
    let date: Date
    let duration: TimeInterval
    let distance: Double
    let route: [CLLocationCoordinate2D]
}
