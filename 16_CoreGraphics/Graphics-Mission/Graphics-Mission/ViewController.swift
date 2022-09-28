//
//  ViewController.swift
//  Graphics-Mission
//
//  Created by 유혜빈 on 2022/09/28.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Draw_Flower()
    }

    func Draw_Flower(){
        UIGraphicsBeginImageContext(self.imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        //Draw Triangle
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.green.cgColor)
        context.setFillColor(UIColor.green.cgColor)
        
        context.move(to: CGPoint(x: 170, y: 200))
        context.addLine(to: CGPoint(x: 200, y: 450))
        context.addLine(to: CGPoint(x: 140, y: 450))
        context.addLine(to: CGPoint(x: 170, y: 200))
        context.fillPath()
        
        context.strokePath()
        
        //Draw Circle
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        var x = 120, y = 150
        var margin = 50
        
        context.addEllipse(in: CGRect(x: x, y: y, width: 100, height: 100))
        context.addEllipse(in: CGRect(x: x+margin, y: y, width: 100, height: 100))
        context.addEllipse(in: CGRect(x: x-margin, y: y, width: 100, height: 100))
        context.addEllipse(in: CGRect(x: x, y: y-margin, width: 100, height: 100))
        context.addEllipse(in: CGRect(x: x, y: y+margin, width: 100, height: 100))
        
        context.strokePath()
        
        
        self.imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }

}

