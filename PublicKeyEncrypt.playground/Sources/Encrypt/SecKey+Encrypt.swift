//
//  SecKey+Crypto.swift
//
//  Created by Kristof Kovacs on 7/2/20.
//  Copyright © 2020 Kristof Kovacs. All rights reserved.
//

import Foundation

/**
    Encryption related extension for `SecKey`
*/
public extension SecKey {
    /**
     Encrypts a string.
     
     - Note: Self needs to be a SecKey representation of the base64 encoded  public key
     
     - Parameters:
        - message: The message to encrypt
        - padding: The padding to use for the encryption. Defaults to .PKCS1
     
     - Returns: An encrypted `Data`
    */
    func encrypt(message: String, padding: SecPadding) -> Data? {
        let buffer = [UInt8](message.utf8)
        var keySize = SecKeyGetBlockSize(self)
        var keyBuffer = [UInt8](repeating: 0, count: keySize)
        let err = SecKeyEncrypt(self, padding, buffer, buffer.count, &keyBuffer, &keySize)
        
        guard err == errSecSuccess else {
            print(err)
            
            return nil
        }
        
        return Data(bytes: keyBuffer, count: keySize)
    }
}
