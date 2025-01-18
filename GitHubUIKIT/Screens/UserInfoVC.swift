//
//  UserInfoVC.swift
//  GitHubUIKIT
//
//  Created by Георгий Борисов on 16.01.2025.
//

import UIKit

class UserInfoVC: UIViewController {
    let headerView = UIView()
    let itemViewOne = UIView()
    let itemViewTwo = UIView()
    let dateLabel = GFBodyLabel(textAlignment: .center)
    var itemViews: [UIView] = []
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        layoutUI()
        getUserInfo()
    }

    func configureViewController() {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }

    func getUserInfo() {
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self = self else {return}

            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self.add(childVC: GFUserInfoHeaderVC(user: user), to: self.headerView)
                    self.add(childVC: GFRepoItemVC(user: user), to: self.itemViewOne)
                    self.add(childVC: GFFollowerItemVC(user: user), to: self.itemViewTwo)
                    self.dateLabel.text = "Github Since \(user.createdAt.convertToDisplayFormat())"
                }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "ok")
            }

        }
    }

    func layoutUI() {

        itemViews = [headerView,itemViewOne,itemViewTwo,dateLabel]

        for itemView in itemViews {
            view.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
        }

        //headerView.backgroundColor = .systemRed
        //itemViewOne.backgroundColor = .systemRed
        //itemViewTwo.backgroundColor = .cyan

        let padding: CGFloat = 20
        let itemHeight: CGFloat = 140

        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: padding),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -padding),
            headerView.heightAnchor.constraint(equalToConstant: 180),

            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: padding),
            itemViewOne.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: padding),
            itemViewOne.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -padding),
            itemViewOne.heightAnchor.constraint(equalToConstant: itemHeight),

            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor,constant: padding),
            itemViewTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: padding),
            itemViewTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: itemHeight),
            
            dateLabel.topAnchor.constraint(equalTo: itemViewTwo.bottomAnchor,constant: padding),
            dateLabel.heightAnchor.constraint(equalToConstant: 18),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: padding),
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
        ])
    }

    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }

    @objc func dismissVC() {
        dismiss(animated: true)
    }
}
