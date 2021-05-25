//
//  defaultManager.swift
//  iOSGenricPods
//
//  Created by Riddhi Patel on 21/05/21.
//

import UIKit
public class DefaultManager{
    public init(){
    }
    public func saveValueInDefault<T : Codable>(value: T, using key : String) {
        let encodedData = try! JSONEncoder().encode(value)
         UserDefaults.standard.setValue(encodedData, forKey: key)
         UserDefaults.standard.synchronize()
     }
    public func getValue<T:Codable>(_ key: String) -> T? {
        if let data = UserDefaults.standard.data(forKey: key)
        {
            do{
                let value = try? JSONDecoder().decode(T.self, from: data)
                return value
            }
           
        }
        
        return self as? T
    }
}

