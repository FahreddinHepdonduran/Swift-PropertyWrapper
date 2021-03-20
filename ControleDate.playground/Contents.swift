import UIKit

@propertyWrapper
struct ExpiredController<Value: ExpressibleByNilLiteral> {
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
}

class FifthTutorial {
    @ExpiredController(seconds: 2)
    var token: String?
}

let obj = FifthTutorial()
obj.token = "token"
print("token-1 \(obj.token ?? "nil")")
DispatchQueue.global().asyncAfter(deadline: .now()+5) {
    print("token-2 \(obj.token ?? "nil")")
}
