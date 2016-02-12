import Foundation
import SwiftyJSON
import UIKit



public class AnimalFactory {
    
    public static func zooFromJSONFileNamed(name:String) -> [Animal]? {
        if let path = NSBundle.mainBundle().pathForResource("zoo", ofType: "json"),
            let contentData = NSFileManager.defaultManager().contentsAtPath(path) {
                
                let json = JSON(data: contentData)
                var zoo = [Animal]()
                
                if let animals = json["animals"].array {
                    for ii in animals {
                        if let object = AnimalFactory.animalFromJSON(ii) {
                            zoo.append(object)
                        }
                    }
                }
                return zoo
        }
        return nil
    }
    
    public static func animalFromJSON(json:JSON) -> Animal? {
        
        let name:String = json["name"].stringValue
        let color:String = json["color"].stringValue
        let type:String = json["type"].stringValue
        let isMale:Bool = json ["isMale"].boolValue
        
        if type == "Duck" {
            return Duck(name:name, color:color, isMale : isMale)
        } else if type == "Fish" {
            return Fish(name:name, color:color, isMale : isMale)
        } else if type == "Bear" {
            return Bear(name: name, color: color, isMale: isMale)
        } else if type == "Lion" {
            return Lion(name: name, color: color, isMale: isMale)
        } else if type == "Seal" {
            return Seal(name: name, color: color, isMale: isMale)
        }
        return nil
    }
    
    //as a switch statement
    /*
    switch type {
    case "Duck":
        return Duck(name:name, color:color, isMale:isMale)
    case "Fish":
        return Fish(name:name, color:color, isMale : isMale)
    case "Bear":
        return Bear(name: name, color: color, isMale: isMale)
    case "Lion":
        return Lion(name: name, color: color, isMale: isMale)
    case "Seal":
        return Seal(name: name, color: color, isMale: isMale)
    default:
        return nil
    }
    */
}