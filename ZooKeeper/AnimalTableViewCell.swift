//
//  AnimalTableViewCell.swift
//  ZooKeeper
//
//  Created by Wayne Bangert on 2/10/16.
//  Copyright © 2016 Wayne Bangert. All rights reserved.
//

import UIKit

class AnimalTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureView()
    }

    var animal:Animal?
    
    
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureView() {
        if let animal = animal {
            iconImageView.image = (animal.loadImage() ?? animal.imageName())
            topLabel.text = animal.name
            bottomLabel.text = animal.report()
        }
    }

}
