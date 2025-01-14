//
//  User.swift
//  GitHubUIKIT
//
//  Created by Георгий Борисов on 13.01.2025.
//

import Foundation

struct User: Codable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var htmlUrl: String
    var following: Int
    var followers: Int
    var createAt: String

}
