//
//  AnalyticsManager.swift
//  Insta
//
//  Created by Мария Елизарова on 29.09.2022.
//

import FirebaseAnalytics
import Foundation

final class AnalyticsManager {
    static let shared = AnalyticsManager()
    
    private init() {}
    
    func logEvent () {
        Analytics.logEvent("", parameters: [:])
    }
}
