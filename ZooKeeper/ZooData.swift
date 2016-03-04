//
//  ZooData.swift
//  ZooKeeper
//
//  Created by Wayne Bangert on 2/18/16.
//  Copyright © 2016 Wayne Bangert. All rights reserved.
//

import Foundation
import Firebase

let FirebaseAppId = "https://wbzookeeper.firebaseio.com/"

enum ZooDataNotifications:String {
    case Updated = "com.lss.zoodata.Updated"
}

public class ZooData {
    public static let sharedInstance = ZooData()
    
    private let dataFileName = "zoo"
    
    let rootRef = Firebase(url: "https://wbzookeeper.firebaseio.com/")
    
    public var zoo:Zoo
    
    private init () {
        if let zoo = ZooFactory.zooFromJSONFileNamed(dataFileName) {
            self.zoo = zoo
        } else {
            self.zoo = Zoo(animals: nil, staff: nil)
        }
    }
    
    public func saveZoo() -> Bool {
        // DELETED return ZooFactory.saveZoo(zoo, toFileNamed:dataFileName)
        
        let result = ZooFactory.saveZoo(zoo, toFileNamed: dataFileName)
        if result {
            NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: ZooDataNotifications.Updated.rawValue, object: nil))
        }
        return result
    }
}