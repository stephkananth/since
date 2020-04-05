//
//  AddStreakRow.swift
//  Streaks
//
//  Created by Steph Ananth on 4/5/20.
//  Copyright © 2020 Steph K. Ananth. All rights reserved.
//

import SwiftUI

struct AddStreakRow: View {

  var viewModel: ViewModel

  @State var name: String = ""
  @State var date: Date = Date()

  @Environment(\.presentationMode) var mode: Binding<PresentationMode>

  var body: some View {
    VStack {
      HStack {
        Text("name:").padding([.leading, .trailing])
        TextField("name", text: self.$name).padding([.leading, .trailing])
      }
      HStack {
        Text("date:").padding([.leading, .trailing])
        Spacer()
      }
      DatePicker("start date:", selection: self.$date, displayedComponents: .date).labelsHidden()
      Spacer()
    }
    .navigationBarTitle("new streak")
    .navigationBarItems(trailing:
      Button(action: {
        let streak = Streak(name: self.name, date: self.date)
        self.viewModel.saveStreak(streak: streak)
        self.mode.wrappedValue.dismiss()
      }) {
        Text("Done")
      }
    )
  }
}

struct AddStreakRow_Previews: PreviewProvider {
  static var previews: some View {
    AddStreakRow(viewModel: ViewModel())
  }
}
