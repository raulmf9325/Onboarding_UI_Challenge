//
//  OnboardModel.swift
//  Onboarding
//
//  Created by Raul Mena on 2/5/20.
//  Copyright © 2020 Raul Mena. All rights reserved.
//

import UIKit


struct OnboardPage{
    var topText: String
    var middleText: String
    var bottomText: String
    var illustration: UIImage?
    var isLastPage: Bool
}

let onboardPages = [
    OnboardPage(topText: "Create an account", middleText: "Connect with people around the world",
                 bottomText: "Users will be able to go live, chat and meet with people near by.", illustration: UIImage(named: "Illustration"), isLastPage: false),
    OnboardPage(topText: "Log in to your account", middleText: "Let's build connection with new peoples",
                 bottomText: "Connect helps you locate the people around you who are closest from your home town!", illustration: UIImage(named: "Illustration2"), isLastPage: false),
    OnboardPage(topText: "Log in to your account", middleText: "Feel the happiness",
    bottomText: "Users will be able to go live, chat and meet with people near by.", illustration: UIImage(named: "Illustration3"), isLastPage: true)
]
