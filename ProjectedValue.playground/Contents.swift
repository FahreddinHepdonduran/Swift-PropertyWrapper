import UIKit

@propertyWrapper
struct ExpiredControl<Value: ExpressibleByNilLiteral> {
    var seconds: TimeInterval
    var until = Date()
    var value: Value = nil
    
    var isExpired: Bool {
        return until<Date()
    }
    
    var wrappedValue: Value {
        get {
            return !self.isExpired ? self.value : nil
        }
        set {
            self.until = Date().addingTimeInterval(seconds)
            self.value = newValue
        }
    }
    
    init(seconds: TimeInterval) {
        self.seconds = seconds
    }
    
    var projectedValue: ExpiredControl {
        return self
    }
}

class SixthTutorial {
    @ExpiredControl(seconds: 2)
    var token: String?
}

let obj = SixthTutorial()
obj.token = "token"
DispatchQueue.global().asyncAfter(deadline: .now()+5) {
    print("token \(obj.token)")
    print(obj.$token.value)
}
