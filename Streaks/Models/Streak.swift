//
//  Streak.swift
//  Streaks
//
//  Created by Steph Ananth on 4/5/20.
//  Copyright © 2020 Steph K. Ananth. All rights reserved.
//

import Foundation

class Streak: NSObject, Identifiable, Comparable {
  
  let id = UUID()
  var name: String
  var start: Date
  
  init(name: String, date: Date) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .long
    dateFormatter.timeStyle = .none
    print("1")
    print(dateFormatter.string(from: date))
    let calendar = Calendar.current
    self.start = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: date, matchingPolicy: .previousTimePreservingSmallerComponents, repeatedTimePolicy: .first, direction: .backward) ?? date
    print("\n2")
    print(dateFormatter.string(from: self.start))
    self.name = name
    super.init()
  }

  func update(name: String? = nil, date: Date? = nil) {
    if let name_temp = name {
      if name_temp != "" {
        self.name = name_temp
      }
    }
    if let date_temp = date {
      let calendar = Calendar.current
      self.start = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: date_temp, matchingPolicy: .previousTimePreservingSmallerComponents, repeatedTimePolicy: .first, direction: .backward) ?? date_temp
    }
  }

  func date() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .long
    dateFormatter.timeStyle = .none
    return dateFormatter.string(from: start)
  }

  func reset(_ date: Date = Date()) {
    let calendar = Calendar(identifier: .gregorian)
    self.start = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: date, matchingPolicy: .previousTimePreservingSmallerComponents, repeatedTimePolicy: .first, direction: .backward) ?? date
  }
  
  func length() -> Int {
    // seconds * ( 1 minute / 60 seconds ) * ( 1 hour / 60 minutes ) * ( 1 day / 24 hours )
    let days = -start.timeIntervalSinceNow * (1.0/60.0) * (1.0/60.0) * (1.0/24.0)
    return Int(days.rounded(.down))
  }
  
  static func < (lhs: Streak, rhs: Streak) -> Bool {
    if lhs.start == rhs.start {
      if lhs.name == rhs.name {
        return lhs.id < rhs.id
      } else {
        return lhs.name < rhs.name
      }
    } else {
      return lhs.start < rhs.start
    }
  }
  
}
