//
//  StreakRow.swift
//  Streaks
//
//  Created by Steph Ananth on 4/5/20.
//  Copyright © 2020 Steph K. Ananth. All rights reserved.
//

import SwiftUI

struct StreakRow: View {
  
  let streak: Streak
  
  var body: some View {
    HStack {
      Text(self.streak.name.lowercased())
        .padding(.leading)
      Spacer()
      Text("\(self.streak.length()) days")
        .padding(.trailing)
    }
  }
}

struct StreakRow_Previews: PreviewProvider {
  static var previews: some View {
    StreakRow(streak: Streak(name: "Example"))
  }
}
