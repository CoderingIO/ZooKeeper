//
//  Zoo.swift
//  ZooKeeper
//
//  Created by Wayne Bangert on 2/18/16.
//  Copyright © 2016 Wayne Bangert. All rights reserved.
//

import Foundation

public class Zoo {
    public var animals:[Animal]
    public var staff:[Staff]
    
    public init(animals:[Animal]?, staff:[Staff]?) {
        self.animals = animals ?? [Animal]()
        self.staff = staff ?? [Staff]()
    }
}
