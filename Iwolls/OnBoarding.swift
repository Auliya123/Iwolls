//
//  OnBoarding.swift
//  Iwolls
//
//  Created by Auliya Michelle Adhana on 12/04/23.
//

import Foundation

struct OnBoarding: Hashable, Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var desc: String
}


extension OnBoarding {
    static let views = [
        OnBoarding(title: "Measure your wall size!", image: "wallAsset", desc: "Move your phone according to the dot appearing on the screen. Move horizontally to get wall length, vertically to get the width."),
        OnBoarding(title: "Measure your openings!", image: "openingsAssets", desc: "If there is any opening in the wall (such as doors, windows, etc), measure the length and width by moving your phone according to the dot appearing on the screen."),
        OnBoarding(title: "Get the Result!", image: "checkedPhone", desc: "You have measured your desired wall size, and voila! We'll show you the amount of paint you need."),
        OnBoarding(title: "Let's Get Started!", image: "paintingPerson", desc: "Activate your camera to start measuring and get your paint result!")
    ]
}
