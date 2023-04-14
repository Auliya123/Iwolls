//
//  IwollsApp.swift
//  Iwolls
//
//  Created by Auliya Michelle Adhana on 10/04/23.
//

import SwiftUI

@main
struct IwollsApp: App {
    static let onBoardingViewModel = OnBoardingViewModel()
    
    var body: some Scene {
        WindowGroup {
            OnBoardingView(onBoardingViewModel: IwollsApp.onBoardingViewModel)
        }
    }
}
