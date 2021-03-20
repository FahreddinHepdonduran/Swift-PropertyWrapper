import UIKit

@propertyWrapper
struct Storage<T> {
    let key: String
    let defaultValue: T
    private let userDefault = UserDefaults.standard
    
    var wrappedValue: T {
        get {
            return userDefault.object(forKey: key) as? T ?? defaultValue
        }
        set {
            userDefault.set(newValue, forKey: key)
        }
    }
    
    init(key: String, value: T) {
        self.key = key
        self.defaultValue = value
    }
}

class ThirdTutorial {
    @Storage(key: "Game_Score", value: 0)
    var gameSCore: Int
}

let obj = ThirdTutorial()
print(obj.gameSCore)
obj.gameSCore = 10
print(obj.gameSCore)
