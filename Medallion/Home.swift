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
    
    var body: some View {
        VStack{
            Image("wolf")
                .resizable()
                .frame(width: 279, height: 286)
        }
        .background(Color(UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)))
        .offset(y: -50)
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
