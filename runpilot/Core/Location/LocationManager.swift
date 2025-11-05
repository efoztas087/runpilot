//
//  LocationManager.swift
//  runpilot
//
//  Created by Efe Oztas on 28/10/2025.
//

import Foundation
import CoreLocation
import Combine

@MainActor
final class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    static let shared = LocationManager()
    
    private let manager = CLLocationManager()
    
    @Published var currentLocation: CLLocation?
    @Published var distanceTraveled: Double = 0.0
    @Published var isRunning: Bool = false
    
    private var lastLocation: CLLocation?
    
    override private init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func requestPermission() {
        manager.requestWhenInUseAuthorization()
    }
    
    func startUpdating() {
        distanceTraveled = 0
        lastLocation = nil
        isRunning = true
        manager.startUpdatingLocation()
    }
    
    func stopUpdating() {
        isRunning = false
        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard isRunning, let newLocation = locations.last else { return }
        
        if let last = lastLocation {
            distanceTraveled += newLocation.distance(from: last)
        }
        lastLocation = newLocation
        currentLocation = newLocation
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse ||
            manager.authorizationStatus == .authorizedAlways {
            manager.startUpdatingLocation()
        }
    }
}
