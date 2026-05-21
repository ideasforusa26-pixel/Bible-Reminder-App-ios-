//
// ReadingPlan.swift
// Bible Reminder
//

import Foundation

struct ReadingPlan {
    let date: Date
    let segments: [String]
    let proverbsChapter: String

    static func defaultPlan() -> ReadingPlan {
        return ReadingPlan(
            date: Date(),
            segments: ["Numbers 26", "Psalm 69", "Isaiah 16", "1 Peter 4"],
            proverbsChapter: "Proverbs 3"
        )
    }
}