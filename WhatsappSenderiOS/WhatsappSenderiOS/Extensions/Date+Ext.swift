//
//  Date+Ext.swift
//  VoxelScan_Swift
//
//  Created by Raúl Iborra on 12/8/22.
//

import Foundation

extension Date {

    static func with(calendar: Calendar = .current, year: Int, month: Int, day: Int) -> Date {
        // Because the `calendar` value is non-nil, it's safe to force unwrap the `date` value
        DateComponents(calendar: calendar, year: year, month: month, day: day).date!
    }

    static func with(calendar: Calendar = .current, year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int) -> Date {
        DateComponents(calendar: calendar, year: year, month: month, day: day, hour: hour, minute: minute, second: second).date!
    }

    func toLocalizedString(withTime: Bool, toLocale localeIdentifier: String) -> String {

        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .short
        if withTime { dateFormat.timeStyle = .medium }

        let locale = Locale(identifier: localeIdentifier)
        dateFormat.locale = locale

        return dateFormat.string(from: self)
    }

    func toString(withFormat format: String) -> String {
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = format

        return dateFormat.string(from: self)
    }
}
