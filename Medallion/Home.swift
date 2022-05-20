//
//  Home.swift
//  Medallion
//
//  Created by Luiz Sena on 11/05/22.
//

import SwiftUI
import CoreHaptics

struct Home: View {
    @State var medallion = Hapatic()
    @StateObject var coordinate = LocationManager()
    @State var latituteKey: String = ""
    @State var longitudeKey: String = ""
    var body: some View {
        
        NavigationView{
            ScrollView{
                VStack{
                    Image("mapa")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .padding(25)
                    Text("Your Cordinates: ")
                        .font(.title)
                    Text("\(coordinate.userLocation.doubleValue()[0])  \(coordinate.userLocation.doubleValue()[1])")
                        .font(.title2)
                    MenuSnippet()
                    Spacer()
                    HStack {
                        TextField("Latitude", text: $latituteKey)
                            .padding()
                            .background(Color.gray.opacity(0.3).cornerRadius(10))
                            .font(.headline)
                            .keyboardType(.decimalPad)
                            .padding()
                        TextField("Longitude", text: $longitudeKey)
                            .padding()
                            .background(Color.gray.opacity(0.3).cornerRadius(10))
                            .font(.headline)
                            .keyboardType(.numbersAndPunctuation)
                            .padding()
                    }
                    NavigationLink("Track",
                                   destination: Mapa()).buttonStyle(.bordered)
                    
                    Spacer()
                    
                }.navigationTitle("Medallion")
            }
        }
        
        //        Text("\(testeLocal.distance(from: CLLocation(latitude: coordinate.userLocation.latitude, longitude: coordinate.userLocation.longitude)))")
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View{
        Group {
            Home()
            Home()
                .preferredColorScheme(.dark)
        }
    }
}


