//
//  UserController.swift
//  FinalProject
//
//  Created by etudiant on 21/09/2022.
//
import UIKit
import FirebaseCore
import FirebaseFirestore
class UserController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var userTV: UITableView!
    private var service: UserService?
    private var allusers = [User]() {
        didSet {
           DispatchQueue.main.async {
               self.users = self.allusers
           }
       }
    }
   
    var users = [User]() {
       didSet {
           DispatchQueue.main.async {
               self.userTV.reloadData()
           }
       }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        userTV.dataSource = self
        userTV.delegate = self
        loadData()
    }
    
    func setupTableView(){
        view.addSubview(userTV)
        userTV.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        userTV.allowsSelection = true
        userTV.isUserInteractionEnabled = true
        userTV.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = users[indexPath.row].lastname
        cell.textLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        cell.detailTextLabel?.text = users[indexPath.row].firstname
        return cell
    }
    
    @IBOutlet weak var firstnameTF: UITextField!
    @IBOutlet weak var lastnameTF: UITextField!
    @IBAction func addUserButton(_ sender: Any) {
        let lastname = lastnameTF.text
        let firstname = firstnameTF.text
        if ((firstname != "") && (lastname != "")){
            service?.set(collectionID: "users", lastname: lastname!, firstname: firstname!)
            lastnameTF.text = ""
            firstnameTF.text = ""
            loadData()
        }else{
            print("Erreur : nom ou prenom manquant")
        }
    }
    
    func loadData() {
            service = UserService()
            service?.get(collectionID: "users") { users in
                self.allusers = users
            }
        }
}
