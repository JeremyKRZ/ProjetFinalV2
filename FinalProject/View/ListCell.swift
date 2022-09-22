//
//  ListCell.swift
//  FinalProject
//
//  Created by Nicolas Davenne on 22/09/2022.
//

import UIKit

class ListCell: UITableViewCell {
    
    @IBOutlet weak var iv: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var countryLbl: UILabel!

    var user: ApiUser!
    
    func setup(_ newUser: ApiUser) {
        user = newUser
        ImageDownloader.shared.fromUrlString(urlString: user.picture.thumbnail) {
            data in self.iv.image = data == nil ?
                UIImage(systemName: "person.circle.fill") :
                UIImage(data: data!)
        }
        self.iv.image = UIImage(named: user.picture.thumbnail)
        self.iv.layer.cornerRadius = self.iv.frame.height / 2
        self.nameLbl.text = user.name.first + " " + user.name.last
        self.countryLbl.text = user.location.country
    }
    
}

