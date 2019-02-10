//
//  Owner.swift
//  GitRepos
//
//  Created by Razvan Rujoiu on 10/02/2019.
//  Copyright © 2019 Rujoiu Razvan. All rights reserved.
//

import Foundation

class Owner: NSObject {
    var login: String?
    var id: Int = 0
    var nodeId: String?
    var url: String?
    var followersUrl: String?
    var subscriptionsUrl: String?
    var reposUrl: String?
    var type: String?
    
    override init() {
        super.init()
    }
    
    convenience init(login: String?, id: Int, nodeId: String?, url: String?, followersUrl: String?, subscriptionsUrl: String?,reposUrl: String?, type: String?) {
        self.init()
        
        self.login = login 
        self.id = id
        self.nodeId = nodeId
        self.url = url
        self.followersUrl = followersUrl
        self.subscriptionsUrl = subscriptionsUrl
        self.reposUrl = reposUrl
        self.type = type
    }
}
