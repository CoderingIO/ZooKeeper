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
    
    var currentWeight:Float?
    var birthday:NSDate?
    var photo:UIImage?
    
    var photoFileName:String?
    
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
    
    public func hasImage() -> Bool {
        return photoFileName != nil
    }
    // returns a bool if it works
    public func saveImage(image:UIImage) -> Bool {
        // create image to save with compression
        if let data = UIImageJPEGRepresentation(image, 0.8) {
            // gauranteed unique identifier
            photoFileName = NSUUID().UUIDString + ".jpg"
            // path to save image to
            let path = pathToFileInDocumentsDirectory(photoFileName!)
            //Test to see where its saving
            print("writing to \(path)")
            // return true if it works
            return data.writeToFile(path, atomically: true)
        }
        return false
    }
    
    public func loadImage() -> UIImage? {
        print("reading from \(photoFileName ?? "no file")")
        guard let filename = photoFileName,
              let path = pathToExistingFileInDocumentsDirectory(filename),
              let image = UIImage(contentsOfFile: path) else { return nil }
        
        return image
    }
    
    public func toDictionary() -> [String:AnyObject] {
        return [ "type": type, "name": name, "isMale": isMale, "color":color, "photoFileName": photoFileName ?? ""]
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