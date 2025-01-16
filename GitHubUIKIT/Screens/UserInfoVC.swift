//
//  UserInfoVC.swift
//  GitHubUIKIT
//
//  Created by Георгий Борисов on 16.01.2025.
//

import UIKit

class UserInfoVC: UIViewController {
    
    var username:String!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func dismissVC() {
        dismiss(animated:true)
    }
}
