//
//  StreaksTests.swift
//  StreaksTests
//
//  Created by Steph Ananth on 3/26/20.
//  Copyright © 2020 Steph K. Ananth. All rights reserved.
//

import XCTest
@testable import Streaks

class StreaksTests: XCTestCase {
  
  func testInit() {
    let name: String = "Test"
    let date: Date = Date()
    let streak: Streak = Streak(name: name, date: date)
    XCTAssertNotNil(streak)
    XCTAssertEqual(streak.name, name)
    XCTAssertEqual(streak.start, date)
  }
  
  func testReset() {
    let name: String = "Test"
    let streak: Streak = Streak(name: name)
    let date: Date = Date()
    streak.reset(date)
    XCTAssertEqual(streak.start, date)
  }
  
  func testLength() {
    let name: String = "Test"
    let streak: Streak = Streak(name: name)
    XCTAssertEqual(streak.length(), 0)
  }

  func testDate() {
    let name: String = "Test"
    let date: Date = Date(timeIntervalSince1970: 0)
    let streak: Streak = Streak(name: name, date: date)
    XCTAssertEqual(streak.date(), "January 1, 1970")
  }
}
