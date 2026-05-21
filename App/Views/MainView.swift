//
// MainView.swift
// Bible Reminder
//

import SwiftUI

struct MainView: View {
    let todayPlan = ReadingPlan.generatePlan(for: Date())

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Today’s Readings")
                    .font(.largeTitle)
                    .bold()

                ForEach(todayPlan.segments, id: \ .self) { segment in
                    Text("- \(segment)")
                }

                Text("Proverbs Chapter: \(todayPlan.proverbsChapter)")
                    .font(.headline)
                    .padding(.top, 16)

                Spacer()
            }
            .padding()
            .navigationTitle("Bible Reminder")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}