//
//  GFFollowerItemVC.swift
//  GitHubUIKIT
//
//  Created by Георгий Борисов on 19.01.2025.
//

import Foundation
import UIKit

class GFFollowerItemVC: GFItemInfoVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }

    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Follower")
    }

    override func actionButtonTapped() {
        delegate.didTapgetFollowers(user: user)
    }
}
