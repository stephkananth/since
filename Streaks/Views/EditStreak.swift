//
//  EditStreak.swift
//  Streaks
//
//  Created by Steph Ananth on 4/6/20.
//  Copyright © 2020 Steph K. Ananth. All rights reserved.
//

import SwiftUI

struct EditStreak: View {

  var streak: Streak

  @State var name: String = ""
  @State var date: Date = Date()

  @Environment(\.presentationMode) var mode: Binding<PresentationMode>

  var body: some View {
    VStack {
      HStack {
        Text("name: ").padding([.leading, .trailing])
        TextField(self.streak.name, text: self.$name).padding([.leading, .trailing])
      }
      HStack {
        Text("date:").padding([.leading, .trailing])
        Spacer()
      }
      DatePicker("start date:", selection: self.$date, displayedComponents: .date).labelsHidden()
      Spacer()
    }
    .navigationBarTitle("edit streak")
    .navigationBarItems(trailing:
      Button(action: {
        self.streak.update(name: self.name, date: self.date)
        self.mode.wrappedValue.dismiss()
      }) {
        Text("done")
      }
    )
  }
}

struct EditStreak_Previews: PreviewProvider {
  static var previews: some View {
    EditStreak(streak: Streak(name: "test", date: Date()))
  }
}
