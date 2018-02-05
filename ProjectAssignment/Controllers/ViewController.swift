//
//  ViewController.swift
//  ProjectAssignment
//
//  Created by apple on 2/3/18.
//  Copyright © 2018 jaffar. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var colectionView: UICollectionView!
    var heros = [Hero]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: false)

     colectionView.delegate = self
        colectionView.dataSource = self
        apiRequestUrl()
       
    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        self.navigationController?.isNavigationBarHidden = true
//    }
    func apiRequestUrl(){
        
        let jsonUrlString = "https://api.opendota.com/api/heroStats"
        guard let url = URL(string:jsonUrlString) else
        {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else{return}
            
            if error == nil{
                do{
                    self.heros = try JSONDecoder().decode([Hero].self, from: data)
                }
                catch{
                    print(error)
                }
                DispatchQueue.main.async {
                    print(self.heros.count)
                    self.colectionView.reloadData()
                }
            }
            }.resume()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.heros.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = colectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCollectionViewCell
        
        cell.titleLabel.text = heros[indexPath.row].localized_name.capitalized
        cell.headerImage.contentMode = .scaleAspectFill
        
        let Linkdef = "https://api.opendota.com"
        let mainLink = Linkdef + heros[indexPath.row].img
        cell.headerImage.downloadedFrom(link: mainLink)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize{
        let width = collectionView.frame.width / 3.2 - 1
       
        return CGSize(width: width, height: width)
   }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let strotyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let destCV = strotyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        destCV.titlename = heros[indexPath.row].localized_name.capitalized
        destCV.name1 = heros[indexPath.row].name
        destCV.baseH = heros[indexPath.row].base_health
        destCV.attackT = heros[indexPath.row].attack_type
        destCV.atakMin = heros[indexPath.row].base_attack_min
        destCV.atakMax = heros[indexPath.row].base_attack_max
        let linkDefault = "https://api.opendota.com"
        destCV.dimag =  linkDefault + heros[indexPath.row].img
        self.navigationController?.pushViewController(destCV, animated: true)
    }
    
}



