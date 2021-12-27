//
//  LearningApp.swift
//  Learning
//
//  Created by Clive Rudd Fernandez on 12/26/21.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
