//
//  Date+Extension.swift
//  HorizontalCalendar
//
//  Created by Salmaan Ahmed on 17/08/2020.
//  Copyright © 2020 Salmaan Ahmed. All rights reserved.
//

import Foundation

public enum WeekPosition {
    case thisWeek
    case beforeThisWeek
    case afterThisWeek
}

public extension Date {

    var day: Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: self)
        return components.day ?? 1
    }
    
    var isToday: Bool {
        let gregorian = Calendar(identifier: .gregorian)
        let thisDate = gregorian.dateComponents([.day, .month, .year], from: self)
        let currentDate = gregorian.dateComponents([.day, .month, .year], from: Date())
        return thisDate == currentDate
    }
    
    var previousDay: Date {
        var components = DateComponents()
        components.day = -1
        return Calendar.current.date(byAdding: components, to: startOfDay)!
    }
    
    var nextDay: Date {
        var components = DateComponents()
        components.day = 1
        return Calendar.current.date(byAdding: components, to: startOfDay)!
    }
    
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }

    var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfDay)!
    }

    var startOfMonth: Date {
        let components = Calendar.current.dateComponents([.year, .month], from: startOfDay)
        return Calendar.current.date(from: components)!
    }

    var endOfMonth: Date {
        var components = DateComponents()
        components.month = 1
        components.second = -1
        return Calendar.current.date(byAdding: components, to: startOfMonth)!
    }
 
    var startOfWeek: Date {
        var gregorian = Calendar(identifier: .gregorian)
        // 设置周一为一周的第一天
        gregorian.firstWeekday = 2
        
        let components = gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)
        return gregorian.date(from: components)!
    }
    
    var startOfNextWeek: Date {
        var gregorian = Calendar(identifier: .gregorian)
        // 设置周一为一周的第一天
        gregorian.firstWeekday = 2
        
        let monday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self.startOfWeek))!
        return gregorian.date(byAdding: .weekOfYear, value: 1, to: monday)!
    }

    var startOfPreviousWeek: Date {
        var gregorian = Calendar(identifier: .gregorian)
        // 设置周一为一周的第一天
        gregorian.firstWeekday = 2
        
        let monday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self.startOfWeek))!
        return gregorian.date(byAdding: .weekOfYear, value: -1, to: monday)!
    }
    
    var weekDates: [Date] {
        var dates: [Date] = []
        for i in 0..<7 {
            dates.append(Calendar.current.date(byAdding: .day, value: i, to: startOfWeek)!)
        }
        return dates
    }

    var dayOfTheWeek: Int {
        var gregorian = Calendar(identifier: .gregorian)
        // 设置周一为一周的第一天
        gregorian.firstWeekday = 2

        // 获取当前日期是星期几
        let dayNumber = gregorian.component(.weekday, from: self)
        
        // 计算从周一开始的索引
        let adjustedDayNumber = dayNumber - gregorian.firstWeekday
        return adjustedDayNumber >= 0 ? adjustedDayNumber : adjustedDayNumber + 7
    }
    
    var iso8601: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        return formatter.string(from: self)
    }
    
    func string(format: String = "dd-MM-yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        formatter.timeZone = TimeZone.current
        return formatter.string(from: self)
    }
    
    static func determineWeekPosition(for date: Date) -> WeekPosition {
        let gregorian = Calendar(identifier: .gregorian)
        
        // 获取当前日期的相关周的开始日期和结束日期
        let now = Date()
        let startOfCurrentWeek = now.startOfWeek
        let startOfNextWeek = now.startOfNextWeek
        
        // 判断传入的日期位置
        if gregorian.isDate(date, inSameDayAs: startOfCurrentWeek) ||
            (date > startOfCurrentWeek && date < startOfNextWeek) {
            return .thisWeek
        } else if date < startOfCurrentWeek {
            return .beforeThisWeek
        } else {
            return .afterThisWeek
        }
    }
    
    // 获取星期几的字符串表示
    func dayOfWeek() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "zh_CN") // 设置为中文
        formatter.dateFormat = "EEEE" // 星期几的格式
        return formatter.string(from: self)
    }
    
    // 可选：获取星期几的缩写
    func shortDayOfWeek() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "zh_CN") // 设置为中文
        formatter.dateFormat = "E" // 星期几的短格式
        return formatter.string(from: self)
    }
}
