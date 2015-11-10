//
//  Repository.swift
//  ExemploParseJSON
//
//  Created by Rodrigo A E Miyashiro on 11/9/15.
//  Copyright © 2015 Rodrigo A E Miyashiro. All rights reserved.
//

import Foundation

class Repository {
    
    // MARK: - Variables
    var id: NSNumber?
    var name: String?
    var fullName: String?
    var description: String?
    var language: String?
    
    // TODO: Inserir outros campos, como: owner, collaborators etc
    
    
    // MARK: - Init
    
    /// Default Initializer
    init() {
        id = 0
        name = ""
        fullName = ""
        description = ""
        language = ""
    }
    
    
    /** Custom Initializer
     - Parameters:
     - idNumber: NSNumber
     - nameRepo: String
     - fullNameRepo: String
     - descriptionRepo: String
     - languageUsed: String
     */
    convenience init(idNumber: NSNumber, nameRepo: String, fullNameRepo: String, descriptionRepo: String, languageUsed: String) {
        self.init()
        
        self.id = idNumber
        self.name = nameRepo
        self.fullName = fullNameRepo
        self.description = descriptionRepo
        self.language = languageUsed
    }
}