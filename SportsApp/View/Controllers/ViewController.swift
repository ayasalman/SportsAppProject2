//
//  ViewController.swift
//  SportsApp
//
//  Created by Aya on 01/02/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var HomeCollectionV: UICollectionView!
    
    var sportArray : NSMutableArray = ["football" , "basketball" , "tennis" , "cricket"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.view.frame.width * 0.45 , height: self.view.frame.width * 0.45)
        
        HomeCollectionV.collectionViewLayout = layout
        
        
        HomeCollectionV.register(HomeCollectionViewCell.nib(), forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        HomeCollectionV.delegate = self
        HomeCollectionV.dataSource = self
    }


}

extension ViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("You Tapped On Sports Screen") //this command to check if it's working
        let leagueView = storyboard?.instantiateViewController(withIdentifier: "leagueID") as! LeagueTableViewController
        leagueView.sportType = (sportArray[indexPath.row] as! String)
        navigationController?.pushViewController(leagueView, animated: true)
    }
}

extension ViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as! HomeCollectionViewCell
        
       //cell.configure(with: UIImage(named: "image")!)
       cell.imageView.image = UIImage(named: sportArray[indexPath.row] as! String)
       cell.sportLabel.text = (sportArray[indexPath.row] as! String)
        return cell
    }
    
  
    
    
}
extension ViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width * 0.5, height: self.view.frame.width * 0.75)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
