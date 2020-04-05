//
//  ContentView.swift
//  Streaks
//
//  Created by Steph Ananth on 3/26/20.
//  Copyright © 2020 Steph K. Ananth. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
  @ObservedObject var viewModel = ViewModel()
  
  var body: some View {
    ZStack {
      NavigationView {
        List(self.viewModel.streaks.sorted()) { streak in
          NavigationLink(destination: ShowStreak(streak: streak)) {
            StreakRow(streak: streak)
          }
        }
          .navigationBarTitle("days since")
          .navigationBarItems(trailing:
            NavigationLink(destination: AddStreakRow(viewModel: self.viewModel)) {
              Text("+")
                .font(.largeTitle)
            }
        )
      }.onAppear(perform: {
        self.viewModel.fetchStreaks()
      })
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
