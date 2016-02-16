import Foundation
import UIKit
import SwiftyJSON


protocol Quackable {
    func quack()
}

protocol Spawnable {
    func spawn ()
}


public class Animal {
    var type:String
    var name:String
    var color:String
    var isMale:Bool
    //optional Data
    var currentWeight:Float?
    var birthday:NSDate?
    var photo:UIImage?
    
    
    public init(type:String, name:String, color:String, isMale:Bool){
        self.type = type
        self.name = name
        self.color = color
        self.isMale = isMale
    }
    
    deinit {
        print("Oh no!")
    }
    
    public func report() -> String {
        return "I'm a \(isMale ? "boy" : "girl") \(color) \(name) animal"
    }
    
    public func imageName() -> UIImage? {
        return UIImage(named: type.lowercaseString)
    }
    
}

public class Duck : Animal, Quackable {
    
    public init(name:String, color:String, isMale:Bool) {
        super.init(type: "Duck", name:name, color:color, isMale:isMale)
    }
    
    public func quack() {
        print("Quack")
    }
}

public class Fish : Animal, Spawnable {
    
    public init(name:String, color:String, isMale:Bool) {
        super.init(type: "Fish", name:name, color:color, isMale:isMale)
    }
    
    public func spawn() {
        print("long trip ahead")
    }
}

public class Bear : Animal {
    public init(name:String, color:String, isMale:Bool) {
        super.init(type: "Bear", name: name, color: color, isMale: isMale)
    }

}

public class Lion : Animal {
    public init(name:String, color:String, isMale:Bool) {
        super.init(type: "Lion", name: name, color: color, isMale: isMale)
    }

}

public class Seal : Animal {
    public init(name:String, color:String, isMale:Bool) {
        super.init(type: "Seal", name: name, color: color, isMale: isMale)
    }
}