//
//  ContentView.swift
//  Medallion
//
//  Created by Luiz Sena on 11/05/22.
//

import SwiftUI
import CoreHaptics

struct ContentView: View {
    
    @State var medallion = Hapatic()
    
    var body: some View {
        VStack{
            Text("Aperte para vibrar")
                .padding()
            Button(action: {
                medallion.vibrar()
            }, label: {Text("vibrar")}).buttonStyle(.borderedProminent)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}

//struct Vibration {
//    let generator = UIImpactFeedbackGenerator()
//    func vibrar() {
//        generator.prepare()
//        generator.impactOccurred(intensity: 1.0)
//    }
//}



