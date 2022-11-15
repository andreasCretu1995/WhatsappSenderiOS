//
//  Array+Ext.swift
//  WhatsappSenderiOS
//
//  Created by Andreas Alexandru Cretu on 14/11/22.
//

import Foundation

extension Array where Element: Equatable {
    
    func removeDuplicates() -> [Element] {
        
        var result = [Element]()
        
        for value in self {
            
            if result.contains(value) == false {
                result.append(value)
            }
        }
        
        return result
    }
}
