//
//  Geofencing.swift
//  Medallion
//
//  Created by Luiz Sena on 17/05/22.
//

import Foundation
import MapKit
import CoreLocation
import SwiftUI

class Geofencing {
    var location = CLLocationManager()
    
    func set(){
        let geofenceRegionCenter: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: -3.744596 , longitude: -38.536652 )
        let geofenceRegion = CLCircularRegion(center: geofenceRegionCenter, radius: 2, identifier: "notifymeonExit")

        geofenceRegion.notifyOnExit = true;
        geofenceRegion.notifyOnEntry = false;
        self.location.startMonitoring(for: geofenceRegion)
       
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
      print("Welcome to Playa Grande! If the waves are good, you can try surfing!")
    //Good place to schedule a local notification
    }
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
    print("Bye! Hope you had a great day at the beach!")
    //Good place to schedule a local notification
    }
    
}

