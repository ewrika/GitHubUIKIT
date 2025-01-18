//
//  Date+Ext.swift
//  GitHubUIKIT
//
//  Created by Георгий Борисов on 19.01.2025.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() ->String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
        
    }
    
}
