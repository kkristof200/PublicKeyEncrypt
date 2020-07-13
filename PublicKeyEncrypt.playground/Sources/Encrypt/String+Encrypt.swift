//
//  String+Crypto.swift
//
//  Created by Kristof Kovacs on 7/2/20.
//  Copyright © 2020 Kristof Kovacs. All rights reserved.
//

import Foundation

/**
    Encryption related extensions for `String`
*/
public extension String {
    /**
     Encrypts a string.
     
     - Note: Self needs to be a base64 encoded String representation of the public key
     
     - Parameters:
        - message: The message to encrypt
        - padding: The padding to use for the encryption. Defaults to .PKCS1
     
     - Returns: A base64 encoded, encrypted `String`
    */
    func encrypt(_ message: String, padding: SecPadding = .PKCS1) -> String? {
        let cleanBase64PublicKey = self
            .replacingOccurrences(of: "-----BEGIN PUBLIC KEY-----", with: "")
            .replacingOccurrences(of: "-----END PUBLIC KEY-----", with: "")
            .replacingOccurrences(of: "\n", with: "")
        
        guard let data = Data(base64Encoded: cleanBase64PublicKey) else {
            return nil
        }
        
        let attributes = [
            kSecAttrKeyType         : kSecAttrKeyTypeRSA,
            kSecAttrKeyClass        : kSecAttrKeyClassPublic,
            kSecAttrKeySizeInBits   : 2048,
            kSecReturnPersistentRef : kCFBooleanTrue as CFBoolean
        ] as CFDictionary
        
        var error: Unmanaged<CFError>? = nil
        
        guard let secKey = SecKeyCreateWithData(data as CFData, attributes, &error) else {
            print(error.debugDescription)
            
            return nil
        }
        
        return secKey.encrypt(message: message, padding: padding)?.base64EncodedString()
    }
    
    /**
     Encrypts a string.
     
     - Note: Self is the message to encrypt
     
     - Parameters:
        - base64PublicKey: The Public key in base64 format
        - padding: The padding to use for the encryption. Defaults to .PKCS1
     
     - Returns: A base64 encoded, encrypted `String`
    */
    func encrypt(with base64PublicKey: String, padding: SecPadding = .PKCS1) -> String? {
        return base64PublicKey.encrypt(self, padding: padding)
    }
}
