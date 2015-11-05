//
//  NSObjcetExtension.swift
//  Kai Lu (Luke)
//
//  Created by Kai Lu on 25/05/15.
//  Copyright (c) 2015 Kai Lu. All rights reserved.
//

import Foundation

extension NSObject {
    func fill<T>(action: (T!) -> ()) -> T! {
        return self as! T
    }
}

extension NSDictionary {
    func parse<T>(key: String) -> T {
        return self.objectForKey(key) as! T
    }
    
    func parse<T>(key: String, anotherValue: T) -> T {
        return (self.objectForKey(key) as? T) ?? anotherValue
    }
}