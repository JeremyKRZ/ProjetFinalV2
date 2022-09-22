//
//  ListController.swift
//  FinalProject
//
//  Created by Nicolas Davenne on 22/09/2022.
//

import UIKit

class ListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var dict: [String: Any]!
    var users: [ApiUser] = []
    let id = "ListCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        onDictReceived()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func onDictReceived() {
        let result = dict["results"] as? Int ?? 0
        let gender = dict["gender"] as? GenderEnum ?? .noGender
        ApiHelper.shared.performRequest(results: result, gender: gender) {
            users in
            DispatchQueue.main.async {
                self.users = users
                self.tableView.reloadData()
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = users[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: id) as? ListCell {
            cell.setup(user)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(users[indexPath.row].name.first)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
     

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
