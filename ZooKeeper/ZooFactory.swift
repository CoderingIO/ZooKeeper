//
//  ZooFactory.swift
//  ZooKeeper
//
//  Created by Wayne Bangert on 2/18/16.
//  Copyright © 2016 Wayne Bangert. All rights reserved.
//

import Foundation


public class ZooFactory {
    
    public static func zooFromJSONFileNamed(name:String) -> Zoo? {
        // check to see if we have one in the docs directory
        var storePath:String!
        
        if let path = pathToExistingFileInDocumentsDirectory(name + ".json") {
            print("loaded from docs directory")
            storePath = path
        } else if let path = NSBundle.mainBundle().pathForResource(name, ofType: "json") {
            print("loaded from bundle")
            storePath = path
        } else {
            return nil
        }
        
        if let path = NSBundle.mainBundle().pathForResource("zoo", ofType: "json"),
            let contentData = NSFileManager.defaultManager().contentsAtPath(path) {
                
                let json = JSON(data: contentData)
                let zoo = Zoo(animals: nil, staff: nil)
                
                if let animals = json["animals"].array {
                    for ii in animals {
                        if let object = AnimalFactory.animalFromJSON(ii) {
                            zoo.animals.append(object)
                        }
                    }
                }
                
                if let staff = json["staff"].array {
                    for ii in staff {
                        if let object = StaffFactory.staffFromJSON(ii) {
                            zoo.staff.append(object)
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
        
    public static func staffFromJSON(json:JSON) -> Staff? {
            
        let name:String = json["name"].stringValue
        let type:String = json["type"].stringValue
        let isMale:Bool = json["isMale"].boolValue
            
        if type == "ZooKeeper" {
            return ZooKeeper(job: type, name: name, isMale: isMale)
        } else if type == "TicketTaker" {
            return TicketTaker(job: type, name: name, isMale: isMale)
        }
        return nil
    }
    
    public static func saveZoo(zoo:Zoo, toFileNamed name:String) -> Bool {
        let path = pathToFileInDocumentsDirectory(name + ".json")
        
        let json = JSON(zoo.toDictionary())
        let str = json.description
        
        do {
            try str.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding)
        }
        catch (let error) {
            print(error)
            return false
        }
        return true
    }
}


