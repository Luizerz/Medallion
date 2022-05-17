//
//  BackMapa.swift
//  Medallion
//
//  Created by Luiz Sena on 16/05/22.
//
import Foundation
import CoreLocation
import MapKit
import SwiftUI


extension Double {
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

struct Location: Identifiable{
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject{
    var medallion = Hapatic()
    
    @Published var region = MKCoordinateRegion()
    var userLocation: CLLocationCoordinate2D {
        if let loc = manager.location?.coordinate {
            return loc
        }
        return CLLocationCoordinate2D(latitude: 1, longitude: 1)
    }
    public let manager = CLLocationManager()
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locations.last.map {
            region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
            )
        }
        let testeLocal: CLLocation = CLLocation(latitude: -3.744573 , longitude: -38.536648 )
        print(locations.last!.distance(from: testeLocal).rounded())
        if locations.last!.distance(from: testeLocal).rounded() <= 3 {
            medallion.vibrar()
        }
    }
}

extension CLLocationCoordinate2D {
    func values() -> String {
        "latitude: \(self.latitude), Longitude: \(self.longitude)"
    }
    
    func doubleValue() -> [Double] {
        let double: [Double] = [self.latitude, self.longitude]
        return double
    }
}
