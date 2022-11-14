//
//  String+Ext.swift
//  WhatsappSenderiOS
//
//  Created by Andreas Alexandru Cretu on 14/11/22.
//

import Foundation

extension String {
    
    var stringByRemovingWhitespaces: String {
        
        let components = components(separatedBy: .whitespaces)
        return components.joined(separator: "")
    }
}
