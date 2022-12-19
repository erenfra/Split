//
//  SplitManager.swift
//  Split
//
//  Created by Renato Oliveira Fraga on 12/19/22.
//

import Foundation

class SplitManager: ObservableObject {
    
    @Published var checkAmount = 0.0
    @Published var numberOfPeople = 2
    @Published var isZeroPercentPressed = true
    @Published var isTenPercentPressed = false
    @Published var isFifteenPercentPressed = false
    @Published var isTwentyPercentPressed = false
    
    var perPerson: Double {
           return checkAmount / Double(numberOfPeople)
       }
    
    var totalPerPerson: Double {
            if isZeroPercentPressed {
                return perPerson
            } else if isTenPercentPressed {
                return perPerson * 1.1
            } else if isFifteenPercentPressed {
                return perPerson * 1.15
            } else {
                return perPerson * 1.2
            }
        }
    
}
