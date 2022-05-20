//
//  MenuSnipped.swift
//  Medallion
//
//  Created by Luiz Sena on 18/05/22.
//

import SwiftUI

struct MenuSnippet: View {
    @StateObject var coordinate = LocationManager()
    @State var isCopied: Bool = false
    let pasteboard = UIPasteboard.general
    
    var body: some View {
        let currentCoordinate: [Double] = coordinate.userLocation.doubleValue()
        if isCopied {
            Button(action: {
                pasteboard.string = "\(currentCoordinate[0]) | \(currentCoordinate[1])"
            }){
                Label("Copy", systemImage: "doc.on.doc.fill")
            }
            .colorMultiply(Color.blue)
            .padding()
            Text("Copied")
        }
        else{
            Button(action: {
                isCopied = true
                pasteboard.string = "\(currentCoordinate[0]) | \(currentCoordinate[1])"
            }) {
                Label("Copy", systemImage: "doc.on.doc")
            }
            .padding()
        }
    }
}


struct MenuSnipped_Previews: PreviewProvider {
    static var previews: some View {
        MenuSnippet()
    }
}
