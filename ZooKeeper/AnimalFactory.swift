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
        let isMale:Bool = json["isMale"].boolValue
        
        var animal:Animal?// = json["photoFileName"]
        
        if type == "Duck" {
            animal = Duck(name:name, color:color, isMale : isMale)
        } else if type == "Fish" {
            animal = Fish(name:name, color:color, isMale : isMale)
        } else if type == "Bear" {
            animal = Bear(name: name, color: color, isMale: isMale)
        } else if type == "Lion" {
            animal = Lion(name: name, color: color, isMale: isMale)
        } else if type == "Seal" {
            animal = Seal(name: name, color: color, isMale: isMale)
        }
        
        let photoPath:String = json["photoFileNme"].stringValue
        if !photoPath.isEmpty {
            animal?.photoFileName = photoPath
        
        }
        
        return animal
    }

}