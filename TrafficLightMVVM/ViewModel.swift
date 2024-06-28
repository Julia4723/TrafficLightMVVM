//
//  ViewModel.swift
//  TrafficLightMVVM
//
//  Created by user on 27.06.2024.
//

import Foundation


class ViewModel: MainViewModelProtocol {
    
    private(set) var currentLight: TrafficLightState = .off
    
    var lightIsOn: CGFloat = 1
    
    var lightIsOff: CGFloat = 0.3
    
    func updateLightState() {
        switch currentLight {
        case .off:
            currentLight = .red
        case .red:
            currentLight = .yellow
        case .yellow:
            currentLight = .green
        case .green:
            currentLight = .red
        }
    }
    
    
    func alphaForLight(_ state: TrafficLightState) -> CGFloat {
        return currentLight == state ? lightIsOn : lightIsOff
    }
    
    
}
