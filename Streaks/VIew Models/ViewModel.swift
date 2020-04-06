//
//  ViewModel.swift
//  Streaks
//
//  Created by Steph Ananth on 4/5/20.
//  Copyright © 2020 Steph K. Ananth. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class ViewModel: ObservableObject {
  
  @Published var streaks = [Streak]()

  init() {
    let calendar = Calendar.current
    var dateComponents = DateComponents()
    dateComponents.timeZone = .current
    dateComponents.hour = 0
    dateComponents.minute = 0
    dateComponents.second = 0
    dateComponents.nanosecond = 0
    dateComponents.year = 2020
    dateComponents.month = 2
    dateComponents.day = 4
    if let date1 = calendar.date(from: dateComponents) {
      let streak1 = Streak(name: "I got my eyebrows done", date: date1)
      streaks.append(streak1)
    }
    dateComponents.month = 3
    dateComponents.day = 18
    if let date2 = calendar.date(from: dateComponents) {
      let streak2 = Streak(name: "I came home", date: date2)
      streaks.append(streak2)
    }
    dateComponents.month = 4
    dateComponents.day = 3
    if let date3 = calendar.date(from: dateComponents) {
      let streak3 = Streak(name: "I last cried", date: date3)
      streaks.append(streak3)
    }

  }
  
  func fetchStreaks() {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
    request.returnsObjectsAsFaults = false
    do {
      let result = try context.fetch(request)
      for data in result as! [NSManagedObject] {
        self.loadStreaks(data: data)
      }
    } catch {
      print("error")
    }
  }
  
  func loadStreaks(data: NSManagedObject) {
    let name = data.value(forKey: "name") as! String
    let date = data.value(forKey: "date") as! Date
    let streak = Streak(name: name, date: date)
    self.streaks.append(streak)
  }
  
  func saveStreak(streak: Streak) {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    let entity = NSEntityDescription.entity(forEntityName: "Item", in: context)
    let newStreak = NSManagedObject(entity: entity!, insertInto: context)
    newStreak.setValue(streak.name, forKey: "name")
    newStreak.setValue(streak.start, forKey: "date")
    do {
      try context.save()
    } catch {
      print("error")
    }
    self.streaks.append(streak)
  }
}
