//
//  Staff.swift
//  ZooKeeper
//
//  Created by Wayne Bangert on 2/11/16.
//  Copyright © 2016 Wayne Bangert. All rights reserved.
//

import UIKit

public class Staff {
    
    var type:String
    var name:String
    var isMale:Bool
    
    public init (type:String, name:String, isMale:Bool) {
        self.type = type
        self.name = name
        self.isMale = isMale
    }
    
    public func jobDetails () -> String {
        return "Hello, I'm \(name) and I do \(type), also I'm a \(isMale ? "boy" : "girl"). Thanks for asking!"
    }
    
}

public class ZooKeeper : Staff {
    
    public init(job: String, name: String, isMale: Bool) {
        super.init(type: "Zoo Keeper", name: name, isMale: isMale)
    }
}

public class TicketTaker : Staff {
    
    public init(job: String, name: String, isMale: Bool) {
        super.init(type: "Ticket Taker", name: name, isMale: isMale)
    }
}

