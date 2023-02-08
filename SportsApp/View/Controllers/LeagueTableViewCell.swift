//
//  LeagueTableViewCell.swift
//  SportsApp
//
//  Created by Michael Hany on 04/02/2023.
//

import UIKit

class LeagueTableViewCell: UITableViewCell
{

    @IBOutlet var leagueScreenImageShow: UIImageView!
    @IBOutlet var leagueScreenNameLabel: UILabel!
    
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
