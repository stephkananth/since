//
//  ShowStreak.swift
//  Streaks
//
//  Created by Steph Ananth on 4/5/20.
//  Copyright © 2020 Steph K. Ananth. All rights reserved.
//

import SwiftUI

struct ShowStreak: View {

  let streak: Streak

  var body: some View {
    VStack {
      Spacer()
      Text("\(self.streak.length()) days ago")
      Text("on \(self.streak.date())")
      Spacer()
    }
    .navigationBarTitle(self.streak.name)
    .navigationBarItems(trailing:
      NavigationLink(destination: EditStreak(streak: self.streak)) {
        Text("edit")
      }
    )
  }
}

struct ShowStreak_Previews: PreviewProvider {
  static var previews: some View {
    ShowStreak(streak: Streak(name: "test", date: Date()))
  }
}
