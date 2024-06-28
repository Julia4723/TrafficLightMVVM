//
//  MainViewModelProtocol.swift
//  TrafficLightMVVM
//
//  Created by user on 27.06.2024.
//

import Foundation

enum TrafficLightState {
    case off, red, yellow, green
}

protocol MainViewModelProtocol {
    
    var currentLight: TrafficLightState { get}
    var lightIsOn: CGFloat {get}
    var lightIsOff: CGFloat {get}
    
    func updateLightState()
    
    func alphaForLight(_ state: TrafficLightState) -> CGFloat
    
}


