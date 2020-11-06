import UIKit

// 1. Creating Dates

// Current Date/Time
let now = Date()

// At a specifing Date/Time offset from now
// Now + 1 minute
let OneMinuteFromNow = Date(timeIntervalSinceNow: 60)
// Now + 1 hour
let OneHourFromNow = Date(timeIntervalSinceNow: 60 * 60)
// Now + 1 day
let OneDayFromNow = Date(timeIntervalSinceNow: 60 * 60 * 24)


// 2. Working With Dates

// Offsetting a date
let OneMinuteLater = now.addingTimeInterval(60)
let OneMinuteEarlier = now.addingTimeInterval(-60)

// Comapring two dates

// Get the difference between two dates
let amISmaller = now.compare(OneMinuteFromNow).rawValue

// Find out how much time has elappsed between two dates
let elapsed = OneMinuteEarlier.timeIntervalSince(now)
let elapsedBetter = OneMinuteEarlier.timeIntervalSinceNow
