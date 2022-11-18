//
//  Array+Ext.swift
//  WhatsappSenderiOS
//
//  Created by Andreas Alexandru Cretu on 14/11/22.
//

import Foundation

extension Array where Element: Hashable {
    
    func removeDuplicates() -> [Element] {
        
        guard hasDuplicates() else { return self }
                
        var result = [Element]()
        
        for value in self {
            
            if result.contains(value) == false {
                result.append(value)
            }
        }
        
        return result
    }
    
    func hasDuplicates() -> Bool {
        
        let dups = Dictionary(grouping: self, by: { $0 }).filter { $1.count > 1 }.keys
        
        return !dups.isEmpty
    }
}
