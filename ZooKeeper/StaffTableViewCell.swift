//
//  StaffTableViewCell.swift
//  ZooKeeper
//
//  Created by Wayne Bangert on 2/15/16.
//  Copyright © 2016 Wayne Bangert. All rights reserved.
//

import UIKit

class StaffTableViewCell: UITableViewCell {
    
    @IBOutlet weak var staffTopLabel: UILabel!
    @IBOutlet weak var staffBottomLabel: UILabel!
    @IBOutlet weak var staffIconImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureView()
        
    }
    
    var staff:Staff?

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configurView() {
        if let staff = staff {
            staffIconImageView.image = (staff.photo ?? staff.imageName())
            staffTopLabel.text = staff.name
            staffBottomLabel.text = staff.report()
        }
    }

}
