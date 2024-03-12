//
//  LocationHandler.swift
//  MusicByLocation
//
//  Created by Freddie H on 08/03/2024.
//

import Foundation
import CoreLocation

class LocationHandler: NSObject, CLLocationManagerDelegate, ObservableObject {
    //press cmd+optn+3 to get quick help up which explains whatever you highlight
    let manager = CLLocationManager()
    let geocoder = CLGeocoder()
    @Published var lastKnownLocation: String = "Your location is: ..."
    
    
    //why do we use override
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestAuthorisation() {
        manager.requestWhenInUseAuthorization()
    }
    
    func requestLocation() {
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //locations may be null
        if let firstLocation = locations.first {
            geocoder.reverseGeocodeLocation(firstLocation, completionHandler: { (placemarks, error) in
                if error != nil {
                    self.lastKnownLocation = "could not perform location lookup from coords"
                }
                else {
                    if let firstPlacemark = placemarks?[0] {
                        self.lastKnownLocation = firstPlacemark.locality ?? "couldn't find locality"
                        //if locality optinal print "..."
                    }
                }
            })
        }
    }
        
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            self.lastKnownLocation = "Error finding location"
        }
    }
