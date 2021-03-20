import UIKit

@propertyWrapper
struct Age {
    let min: Int
    let max: Int
    var value: Int
    
    var wrappedValue: Int {
        get {
            return value
        }
        set {
            value = Swift.max(Swift.min(newValue, self.max), self.min)
        }
    }
    
    init(wrappedValue: Int, minAge: Int, maxAge: Int) {
        self.min = minAge
        self.max = maxAge
        self.value = wrappedValue
        self.wrappedValue = wrappedValue
    }
}

class FourthTutorial {
    @Age(minAge: 9, maxAge: 18)
    var teenAge: Int = 0
}

let obj = FourthTutorial()
print("info: \(obj.teenAge)")
obj.teenAge = 16
print("info: \(obj.teenAge)")
obj.teenAge = 2
print("info: \(obj.teenAge)")
