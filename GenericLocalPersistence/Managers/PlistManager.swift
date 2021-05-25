//
//  PlistManager.swift
//  GenericLocalPersistence
//
//  Created by Riddhi Patel on 25/05/21.
//

import UIKit

//MARK:ERROR ENUM
enum PlistError: Error {
       case failedToWrite
       case fileDoesNotExist
}
public class plistManager
{
    //MARK:VARIABLE DECLRATION
    private let fileManager = FileManager.default
    let name:String
    
    //MARK:INITIALIZATION
    public  init?(named :String) {
        self.name = named
    }

    public func defaultPath() -> String{
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        return paths.appending("/\(self.name).plist")
    }
    
    //MARK:SAVE DICTIONARY VALUE IN PLIST
    
    public func saveDatatoPlist<T : Codable>(value: T, using key : String) {
        let fileManager = FileManager.default
        if (!(fileManager.fileExists(atPath: defaultPath())))
        {
            do {
                let bundlePath : NSString = Bundle.main.path(forResource:  self.name, ofType: "plist")! as NSString
                try fileManager.copyItem(atPath: bundlePath as String, toPath: defaultPath())
            }catch {
               print(error)
            }
        }
        let plistDict:NSMutableDictionary = NSMutableDictionary(contentsOfFile: defaultPath())!
        if(type(of: value) is AnyClass){
            plistDict.setValue(value.dictionary, forKey: key)
        }
        else {
            plistDict.setValue(value, forKey: key)
        }
        plistDict.write(toFile: defaultPath(), atomically: true)
    }
    
    //MARK:GET DICTIONARY VALUE IN PLIST
    public func getDictionary<T>(key : String) -> T? {
       
        guard fileManager.fileExists(atPath: defaultPath()) else {
            return self as? T
        }
        let valueOfDictionary = NSDictionary(contentsOfFile: defaultPath())
        let value1 = valueOfDictionary?.object(forKey: key)
        print(value1!)
        return value1 as? T
    }
   
}
