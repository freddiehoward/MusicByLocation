//
//  LocationHandler.swift
//  MusicByLocation
//
//  Created by Freddie H on 08/03/2024.
//

import Foundation
import CoreLocation

class LocationHandler {
    //press cmd+optn+3 to get quick help up which explains whatever you highlight
    let manager = CLLocationManager()
    
    func requestAuthorisation() {
        manager.requestWhenInUseAuthorization()
        //AT 3rd video in 1st part of music finder on canvas
    }
}
