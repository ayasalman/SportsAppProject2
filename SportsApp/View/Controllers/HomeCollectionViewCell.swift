//
//  HomeCollectionViewCell.swift
//  SportsApp
//
//  Created by Aya on 03/02/2023.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageView : UIImageView!
    
    static let identifier = "HomeCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with image: UIImage)
    {
        imageView.image = image
    }
    
    static func nib() -> UINib
    {
        return UINib(nibName: HomeCollectionViewCell.identifier, bundle: nil)
    }

}
