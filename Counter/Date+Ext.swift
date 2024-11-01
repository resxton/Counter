//
//  Date+Ext.swift
//  Counter
//
//  Created by Сомов Кирилл on 01.11.2024.
//

import Foundation

extension Date {
    func normalizeDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        return dateFormatter.string(from: self)
    }
}
