import UIKit

@propertyWrapper
struct Logger {
    var value: Int?
    
    var wrappedValue: Int? {
        get {
            return value
        }
        set {
            print("[Info] \(newValue)")
            value = newValue
        }
    }
}

class FirstTutorial {
    @Logger
    var gameScore: Int?
    
    @Logger
    var currentLevel: Int?
}

let obj1 = FirstTutorial()
obj1.currentLevel = 10
obj1.gameScore = 5
obj1.gameScore = 6
