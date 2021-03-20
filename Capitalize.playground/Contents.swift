import UIKit

@propertyWrapper
struct Capitalize {
    private var value: String
    
    var wrappedValue: String {
        get {
            return value
        }
        set {
            value = newValue.capitalized
        }
    }
    
    init(defaultValue value: String) {
        self.value = value
    }
}

class SecondTutorial {
    @Capitalize(defaultValue: "name")
    var userName: String
}

let obj = SecondTutorial()
print(obj.userName)
obj.userName = "erven"
print(obj.userName)
let name = obj.userName
print(name)
