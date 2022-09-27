//
//  imageViewController.swift
//  tabBarController
//
//  Created by 유혜빈 on 2022/09/24.
//

import UIKit

class imageViewController: UIViewController {
    @IBOutlet weak var reSizeButton: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    
    var isZoom = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imgView.image = UIImage(named: "lamp_on.png")
    }
    
    @IBAction func tapResizeButton(_ sender: UIButton) {
        var newWidth: CGFloat, newHeight:CGFloat
        
        if isZoom{
            newWidth = self.imgView.frame.width/2.0
            newHeight = self.imgView.frame.height/2.0
            self.reSizeButton.setTitle("확대", for: .normal)
        }else{
            newWidth = self.imgView.frame.width*2.0
            newHeight = self.imgView.frame.height*2.0
            self.reSizeButton.setTitle("축소", for: .normal)
        }
        
        self.imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    
    @IBAction func changlLamp(_ sender: UISwitch) {
        if sender.isOn{
            self.imgView.image = UIImage(named: "lamp_on.png")
        }else{
            self.imgView.image = UIImage(named: "lamp_off.png")
        }
    }
}
