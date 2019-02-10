//
//  ViewController.swift
//  GitRepos
//
//  Created by Razvan Rujoiu on 04/02/2019.
//  Copyright © 2019 Rujoiu Razvan. All rights reserved.
//
import UIKit
import Alamofire


class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var repositories = [Repository]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.repositories = [Repository]()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.makeGetCall()
    }
    
    func makeGetCall() {
        let endpoint: String = "https://api.github.com/search/repositories?q=language:swift,objc&order=desc&sort=stars"
        AF.request(endpoint).responseJSON { response in

            if let mainResponseDict = response.result.value as? [String: Any],
                let json = mainResponseDict["items"] as? [[String: Any]] {
                
                for dict in json {
                    
                    var owner = Owner()
                    
                    if let ownerDict = dict["owner"] as? [String: Any] {
                        owner = Owner(login: ownerDict["login"] as? String, id: ownerDict["id"] as! Int, nodeId: ownerDict["node_id"] as? String, url: ownerDict["url"] as? String, followersUrl: ownerDict["followers_url"] as? String, subscriptionsUrl: ownerDict["subscriptions_url"] as? String, reposUrl: ownerDict["repos_url"] as? String, type: ownerDict["type"] as? String)
                    }
                    
                    let repo = Repository(id: dict["id"] as! Int, name: dict["name"] as? String, description: dict["description"] as? String, forksUrl: dict["forks_url"] as? String, commitsUrl: dict["commits_url"] as? String, downloadsUrl: dict["downloads_url"] as? String, languagesUrl: dict["languages_url"] as? String, contributorsUrl: dict["contributors_url"] as? String, branchesUrl: dict["branches_url"] as? String, reposUrl: dict["repos_url"] as? String, owner: owner, forks: dict["forks"] as? Int, watchers: dict["watchers"] as? Int, issues: dict["issues"] as? Int, htmlUrl: dict["html_url"] as? String)
                    
                    self.repositories.append(repo)
                    
                }
                
                self.refreshTableView()
                
            } else {
                
                print("bad response")
                
            }
        }
    }
    
    func refreshTableView() {

        self.tableView.reloadData()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repositories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCell
        cell.repoNameLabel.text = self.repositories[indexPath.row].name ?? "Empty"
        cell.repoRating.text = String(self.repositories[indexPath.row].watchers!)
        // cell?.textLabel?.text = self.repositories[indexPath.row].name ?? "Empty"
        return cell
        
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let repo = self.repositories[indexPath.row]
        
        print(repo.forks!)
        print(repo.watchers!)
        
        self.performSegue(withIdentifier: "detailsSegue", sender: self)
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                var repo = repositories[indexPath.row]
                let detailVC = segue.destination as? DetailViewController
                detailVC?.repository = repo
            }
        }
          
    }


}

