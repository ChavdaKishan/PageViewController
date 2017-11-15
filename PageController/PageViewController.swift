//
//  PageViewController.swift
//  PageController
//
//  Created by iFlame on 11/14/17.
//  Copyright © 2017 iflame. All rights reserved.
//

import UIKit

class PageViewController: UIViewController
{
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var Lbl: UILabel!
    
    var imgName : String?
    var strTitle : String?
    var pageIndex : Int?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        Image.image = UIImage(named: imgName!)
        self.Lbl.text = self.strTitle
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
