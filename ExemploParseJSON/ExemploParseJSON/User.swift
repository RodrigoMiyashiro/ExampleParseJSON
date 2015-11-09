//
//  User.swift
//  ExemploParseJSON
//
//  Created by Rodrigo A E Miyashiro on 11/9/15.
//  Copyright © 2015 Rodrigo A E Miyashiro. All rights reserved.
//

import Foundation

class User {
    
    // MARK: - Variables
    var login: String?
    var id: NSNumber?
    var avatar_url: NSURL?
    var html_url: NSURL?
    
    
    
    // MARK: - Init
    
    /// Default Initializer
    init() {
        login = ""
        id = 0
    }
    
    
    /** Custom Initializer
    - Parameters: 
        - NSArray: with login(String), id(NSNumber), avatar_url(NSURL), html_url(NSURL)
    */
    convenience init (aArrayUser: NSArray) {
        self.init()
        
        self.login = aArrayUser[0] as? String
        self.id = aArrayUser[1] as? NSNumber
        
        let imagem = aArrayUser[2] as? String
        self.avatar_url = NSURL(string: imagem!)
        
        let html = aArrayUser[3] as? String
        self.html_url = NSURL(string: html!)
    }
}