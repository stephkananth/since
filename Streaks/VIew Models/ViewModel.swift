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
