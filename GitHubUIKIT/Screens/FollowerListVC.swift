//
//  FollowerListVC.swift
//  GitHubUIKIT
//
//  Created by Георгий Борисов on 13.01.2025.
//

import UIKit

class FollowerListVC: UIViewController {

    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true

    }

}
