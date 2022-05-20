//
//  Mapa.swift
//  Medallion
//
//  Created by Luiz Sena on 13/05/22.
//

import SwiftUI
import CoreLocation

struct Mapa: View {
    let testeLocal: CLLocation = CLLocation(latitude: -3.744573 , longitude: -38.536648 )
    let pasteboard = UIPasteboard.general
    
    @State var medallion = Hapatic()
    @StateObject var coordinate = LocationManager()
    
    let active: Bool = true
    
    var body: some View {
        let distancia = testeLocal.distance(from: CLLocation(latitude: coordinate.userLocation.latitude, longitude: coordinate.userLocation.longitude)).round(to: 10)
//        Text("\(coordinate.userLocation.doubleValue()[0])  \(coordinate.userLocation.doubleValue()[1])")
//        Button(action: {pasteboard.string = coordinate.userLocation.values()}, label: {Text("Copy Current Coordinates")}).buttonStyle(.bordered)
        VStack {
            if distancia <= 3{
                Image("medalhaoVibrate")
            }
            else if distancia <= 6 {
                Image("medalhaoMedio")
            }else{
                Image("medalhaoClean")
            }
            Text("Distancia do ponto: ")
            Text("\(distancia) M")
        }
        .onAppear {
            coordinate.vibrarHabilitado = true
        }
            
    }
}

struct Mapa_Previews: PreviewProvider {
    static var previews: some View {
        Mapa()
    }
}


//Text("\(coordinate.manager.location?.coordinate.values() ?? CLLocationCoordinate2D(latitude: 2, longitude: 2).values())")

//Map(coordinateRegion: $coordinate.region)

//    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
