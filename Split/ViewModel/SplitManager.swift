//
//  SplitManager.swift
//  Split
//
//  Created by Renato Oliveira Fraga on 12/19/22.
//

import Foundation
import Combine

class SplitManager: ObservableObject {
    
    @Published var checkAmount = 0.0
    @Published var numberOfPeople = 2
    @Published var isZeroPercentPressed = true
    @Published var isTenPercentPressed = false
    @Published var isFifteenPercentPressed = false
    @Published var isTwentyPercentPressed = false


    var perPerson: Double {
        let result = self.checkAmount / Double(self.numberOfPeople)
        print(checkAmount)
        print(result)
        return result
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
    
    func add() {
        if numberOfPeople >= 99 {
            return numberOfPeople = 99
        }  else {
            return numberOfPeople += 1
        }
        
    }
    
    func dec() {
        if numberOfPeople == 1 {
            return numberOfPeople = 1
        }  else {
            return numberOfPeople -= 1
        }
        
    }
    
    func zeroPressed() {
        isZeroPercentPressed = true
        isTenPercentPressed = false
        isFifteenPercentPressed = false
        isTwentyPercentPressed = false
    }
    
    func tenPressed() {
        isZeroPercentPressed = false
        isTenPercentPressed = true
        isFifteenPercentPressed = false
        isTwentyPercentPressed = false
    }
    
    func fiftenPressed() {
        isZeroPercentPressed = false
        isTenPercentPressed = false
        isFifteenPercentPressed = true
        isTwentyPercentPressed = false
    }
    
    func twentyPressed() {
        isZeroPercentPressed = false
        isTenPercentPressed = false
        isFifteenPercentPressed = false
        isTwentyPercentPressed = true
    }
    
}
