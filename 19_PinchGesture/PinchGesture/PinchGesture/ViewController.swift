//
//  ViewController.swift
//  PinchGesture
//
//  Created by 유혜빈 on 2022/10/11.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    
    var initalFontSize: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(doPinch(_ :)))
        self.view.addGestureRecognizer(pinch)
    }

    @objc func doPinch(_ pinch: UIPinchGestureRecognizer){
        if(pinch.state == UIGestureRecognizer.State.began){
            initalFontSize = self.textLabel.font.pointSize
        }else{
            self.textLabel.font = self.textLabel.font.withSize(initalFontSize + pinch.scale)
        }
    }
}

