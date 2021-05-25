//
//  KeyChainManager.swift
//  GenericLocalPersistence
//
//  Created by Riddhi Patel on 25/05/21.
//

import UIKit
import Security

// Constant Identifiers
let userAccount = "AuthenticatedUser"
let accessGroup = "SecuritySerivice"


/**
 *  User defined keys for new entry
 *  Note: add new keys for new secure item and use them in load and save methods
 */

let passwordKey = "KeyForPassword"

// Arguments for the keychain queries
let kSecClassValue = NSString(format: kSecClass)
let kSecAttrAccountValue = NSString(format: kSecAttrAccount)
let kSecValueDataValue = NSString(format: kSecValueData)
let kSecClassGenericPasswordValue = NSString(format: kSecClassGenericPassword)
let kSecAttrServiceValue = NSString(format: kSecAttrService)
let kSecMatchLimitValue = NSString(format: kSecMatchLimit)
let kSecReturnDataValue = NSString(format: kSecReturnData)
let kSecMatchLimitOneValue = NSString(format: kSecMatchLimitOne)


public class KeyChainManager {
    public  init?() {
    }
    
    public  func setPasscode(identifier: String, passcode: String) {
        if let dataFromString = passcode.data(using: String.Encoding.utf8) {
            let keychainQuery = [
                kSecClassValue: kSecClassGenericPasswordValue,
                kSecAttrServiceValue: identifier,
                kSecValueDataValue: dataFromString
            ] as CFDictionary
            SecItemDelete(keychainQuery)
            print(SecItemAdd(keychainQuery, nil))
        }
        
        
    }

    public func getPasscode(identifier: String) -> String? {
        let keychainQuery = [
            kSecClassValue: kSecClassGenericPasswordValue,
            kSecAttrServiceValue: identifier,
            kSecReturnDataValue: kCFBooleanTrue,
            kSecMatchLimitValue: kSecMatchLimitOneValue
        ] as  CFDictionary
        var dataTypeRef: AnyObject?
        let status: OSStatus = SecItemCopyMatching(keychainQuery, &dataTypeRef)
        var passcode: String?
        if (status == errSecSuccess) {
            if let retrievedData = dataTypeRef as? Data,
                let result = String(data: retrievedData, encoding: String.Encoding.utf8) {
                passcode = result as String
            }
        }
        else {
            print("Nothing was retrieved from the keychain. Status code \(status)")
        }
        return passcode
    }
}
