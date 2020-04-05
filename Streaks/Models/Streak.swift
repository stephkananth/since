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
  
  init(name: String, date: Date = Date()) {
    self.name = name
    self.start = date
    super.init()
  }

  func date() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .none
    return dateFormatter.string(from: start)
  }

  func reset(_ date: Date = Date()) {
    self.start = date
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
