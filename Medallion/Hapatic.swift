//
//  Hapatic.swift
//  Medallion
//
//  Created by Luiz Sena on 11/05/22.
//

import Foundation
import CoreHaptics

struct Hapatic {
    let hapticDict = [
        CHHapticPattern.Key.pattern: [
            [CHHapticPattern.Key.event: [
                CHHapticPattern.Key.eventType: CHHapticEvent.EventType.hapticContinuous,
                CHHapticPattern.Key.time: CHHapticTimeImmediate,
                CHHapticPattern.Key.eventDuration: 2.0]
            ]
        ]
    ]

    var engine: CHHapticEngine?
    
  mutating func vibrar(){
        do {
            engine = try CHHapticEngine()
            let pattern = try CHHapticPattern(dictionary: hapticDict)
            let player = try self.engine?.makePlayer(with: pattern)
            try self.engine?.start()
            try player?.start(atTime: 0)
        }catch {
            print("pattern creation error")
        }
    }
}




















//let hapticDict = [
//    CHHapticPattern.Key.pattern: [
//        [CHHapticPattern.Key.event: [
//            CHHapticPattern.Key.eventType: CHHapticEvent.EventType.hapticContinuous,
//            CHHapticPattern.Key.time: CHHapticTimeImmediate,
//            CHHapticPattern.Key.eventDuration: 1]
//        ]
//    ]
//]
//
//func vibrate() {
//
//    do {
//        let engine = try CHHapticEngine()
//        try engine.start()
//        let pattern = try CHHapticPattern(dictionary: hapticDict)
//        let player = try engine.makePlayer(with: pattern)
//        try player.start(atTime: 0)
//    } catch {
//        print("Deu Pau!")
//    }
//}
