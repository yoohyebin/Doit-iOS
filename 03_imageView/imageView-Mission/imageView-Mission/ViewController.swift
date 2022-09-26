//
//  ViewController.swift
//  imageView-Mission
//
//  Created by 유혜빈 on 2022/09/26.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    
    var currentImage = 1
    var maxImage = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imgView.image = UIImage(named: String(currentImage)+".png")
    }
    
    @IBAction func tapBeforeButton(_ sender: UIButton) {
        if currentImage == 1{
            currentImage = maxImage
        }else{
            currentImage -= 1
        }
        
        self.imgView.image = UIImage(named: String(currentImage)+".png")
    }
    
    @IBAction func tapNextButton(_ sender: UIButton) {
        if currentImage == maxImage{
            currentImage = 1
        }else{
            currentImage += 1
        }
        
        self.imgView.image = UIImage(named: String(currentImage)+".png")
    }
}

