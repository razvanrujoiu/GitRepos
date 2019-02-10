//
//  Repository.swift
//  GitRepos
//
//  Created by Razvan Rujoiu on 10/02/2019.
//  Copyright © 2019 Rujoiu Razvan. All rights reserved.
//

import Foundation

class Repository: NSObject {
    
    var id: Int = 0
    var name: String?
    var descriptionText: String?
    var forksUrl: String?
    var commitsUrl: String?
    var downloadsUrl: String?
    var languagesUrl: String?
    var contributorsUrl: String?
    var branchesUrl: String?
    var reposUrl: String?
    var owner: Owner?
    var forks: Int?
    var watchers: Int?
    var issues: Int?
    var htmlUrl: String?
    
    override init() {
        super.init()
    }
    
    convenience init(id: Int) {
        self.init()
        
        self.id = id
    }
    
    convenience init(id: Int, name: String?, description: String?, forksUrl: String?, commitsUrl: String?, downloadsUrl: String?, languagesUrl: String?, contributorsUrl: String?, branchesUrl: String?, reposUrl: String?, owner: Owner, forks: Int?, watchers: Int?, issues: Int?, htmlUrl: String?) {
        
        self.init(id: id)
        
        self.name = name
        self.descriptionText = description
        self.forksUrl = forksUrl
        self.commitsUrl = commitsUrl
        self.downloadsUrl = downloadsUrl
        self.languagesUrl = languagesUrl
        self.contributorsUrl = contributorsUrl
        self.branchesUrl = branchesUrl
        self.reposUrl = reposUrl
        self.owner = owner
        self.forks = forks
        self.watchers = watchers
        self.issues = issues
        self.htmlUrl = htmlUrl
    }
    
}
