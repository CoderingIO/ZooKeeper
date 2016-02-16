//
//  StaffFactory.swift
//  ZooKeeper
//
//  Created by Wayne Bangert on 2/11/16.
//  Copyright © 2016 Wayne Bangert. All rights reserved.
//

import UIKit
import SwiftyJSON

public class StaffFactory {
    
    public static func zooFromJSONFileNamed(name:String) -> [Staff]? {
        if let path = NSBundle.mainBundle().pathForResource("zoo", ofType: "json"),
            let contentData = NSFileManager.defaultManager().contentsAtPath(path) {
                
                let json = JSON(data: contentData)
                var zoo = [Staff]()
                
                if let staff = json["staff"].array {
                    for ii in staff {
                        if let object = StaffFactory.staffFromJSON(ii) {
                            zoo.append(object)
                        }
                    }
                }
                return zoo
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
}
