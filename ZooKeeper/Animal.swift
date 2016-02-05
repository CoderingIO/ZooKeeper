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
    var name:String
    var color:String
    
    public init(name:String, color:String){
        self.name = name
        self.color = color
    }
    
    deinit {
        print("Oh no!")
    }
    
    public func report() {
        print("I'm a \(color) \(name) animal")
    }
    
    
}

public class Duck : Animal, Quackable {
    
    public init(color:String) {
        super.init(name: "Duck", color:color)
    }
    
    
    
    public func quack() {
        print("Quack")
    }
}

public class Fish : Animal, Spawnable {
    
    public init(color:String) {
        super.init(name: "Fish", color:color)
    }
    
    public func spawn() {
        print("long trip ahead")
    }
}
