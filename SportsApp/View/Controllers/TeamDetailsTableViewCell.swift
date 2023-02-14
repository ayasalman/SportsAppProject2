//
//  TeamDetailsTableViewCell.swift
//  SportsApp
//
//  Created by Michael Hany on 14/02/2023.
//

import UIKit

class TeamDetailsTableViewCell: UITableViewCell
{
    @IBOutlet var playerImage: UIImageView!
    @IBOutlet var playerName: UILabel!
    @IBOutlet var playerNumber: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
