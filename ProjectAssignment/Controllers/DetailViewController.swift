//
//  DetailViewController.swift
//  ProjectAssignment
//
//  Created by apple on 2/3/18.
//  Copyright © 2018 jaffar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImg: UIImageView!
    @IBOutlet weak var dlabel: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var baseHealth: UILabel!
    @IBOutlet weak var attackType: UILabel!
    @IBOutlet weak var attackMin: UILabel!
    @IBOutlet weak var attackMax: UILabel!
    
    
    var dimag : String!
    var titlename : String? = ""
    var name1: String? = ""
    var baseH: Int? = 0
    var attackT: String? = ""
    var atakMin: Float? = 0.0
    var atakMax: Float? = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dlabel.text = titlename
        detailImg.downloadedFrom(link: dimag)
        name.text = name1
        baseHealth.text = String(baseH!)
        attackType.text = attackT
        attackMin.text = String(atakMin!)
        attackMax.text = String(atakMax!)
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
