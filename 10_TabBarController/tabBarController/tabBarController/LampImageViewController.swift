//
//  LampImageViewController.swift
//  tabBarController
//
//  Created by 유혜빈 on 2022/10/05.
//

import UIKit

class LampImageViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var zoomButton: UIButton!
    
    var isZoom = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imgView.image = UIImage(named: "lamp_on.png")
    }

    @IBAction func tapZoomButton(_ sender: UIButton) {
        var newWidth: CGFloat, newHeight: CGFloat
        
        if isZoom{ //zoom out action
            newWidth = self.imgView.frame.width/2.0
            newHeight = self.imgView.frame.height/2.0
            self.zoomButton.setTitle("확대", for: .normal)
        }else{ //zoom in action
            newWidth = self.imgView.frame.width*2.0
            newHeight = self.imgView.frame.height*2.0
            self.zoomButton.setTitle("축소", for: .normal)
        }
        
        self.imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    
    @IBAction func lampSwitch(_ sender: UISwitch) {
        if sender.isOn{
            self.imgView.image = UIImage(named: "lamp_on.png")
        }else{
            self.imgView.image = UIImage(named: "lamp_off.png")
        }
    }
}
