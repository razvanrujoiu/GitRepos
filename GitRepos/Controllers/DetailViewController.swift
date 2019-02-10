//
//  DetailViewController.swift
//  GitRepos
//
//  Created by Razvan Rujoiu on 05/02/2019.
//  Copyright © 2019 Rujoiu Razvan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var forksLabel: UILabel!
   
    @IBOutlet weak var watchersLabel: UILabel!
    
    @IBOutlet weak var ownerLabel: UILabel!
   
    @IBOutlet weak var linkBtn: UIButton!
    
    @IBOutlet weak var descriptionTV: UITextView!
    
    var repository: Repository!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        forksLabel.text = String(repository!.forks!)
        watchersLabel.text = String(repository!.watchers!)
        ownerLabel.text = repository!.owner?.login
        linkBtn.setTitle(repository!.htmlUrl, for: .normal)
        descriptionTV.text = repository!.descriptionText
    }
    
    @IBAction func onTapLink(_ sender: Any) {
        if let url = NSURL(string: repository!.htmlUrl!)  {
            UIApplication.shared.open(url as URL)
        }
    }
    
}
