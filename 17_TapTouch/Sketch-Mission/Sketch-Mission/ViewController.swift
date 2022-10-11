//
//  ViewController.swift
//  Sketch-Mission
//
//  Created by 유혜빈 on 2022/10/10.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lineSizeText: UITextField!
    
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    
    var lastPoint: CGPoint!
    var lineSize: CGFloat = 2.0
    var lineColor = UIColor.black.cgColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.blueButton.alpha = 0.2
        self.greenButton.alpha = 0.2
        self.redButton.alpha = 0.2
    }

    @IBAction func tapBlackButton(_ sender: UIButton) {
        lineColor = UIColor.black.cgColor
        
        self.blackButton.alpha = 1.0
        self.blueButton.alpha = 0.2
        self.greenButton.alpha = 0.2
        self.redButton.alpha = 0.2
    }
    
    @IBAction func tapBlueButton(_ sender: UIButton) {
        lineColor = UIColor.blue.cgColor
        
        self.blackButton.alpha = 0.2
        self.blueButton.alpha = 1.0
        self.greenButton.alpha = 0.2
        self.redButton.alpha = 0.2
    }
    
    @IBAction func tapGreenButton(_ sender: UIButton) {
        lineColor = UIColor.green.cgColor
        
        self.blackButton.alpha = 0.2
        self.blueButton.alpha = 0.2
        self.greenButton.alpha = 1.0
        self.redButton.alpha = 0.2
    }
    @IBAction func tapRedButton(_ sender: UIButton) {
        lineColor = UIColor.red.cgColor
        
        self.blackButton.alpha = 0.5
        self.blueButton.alpha = 0.5
        self.greenButton.alpha = 0.5
        self.redButton.alpha = 1.0
    }
    
    @IBAction func tapClearButton(_ sender: UIButton) {
        self.imgView.image = nil
    }
    
    @IBAction func lineSizeDidEndOnExit(_ sender: UITextField) {
        lineSize = CGFloat(Int(self.lineSizeText.text!)!)
    }
    
    @IBAction func lineSizeEditChange(_ sender: UITextField) {
        if self.lineSizeText.text != ""{
            lineSize = CGFloat(Int(self.lineSizeText.text!)!)
        }
    }
    
    @IBAction func lineSizeTouchDown(_ sender: UITextField) {
        self.lineSizeText.selectAll(UITextField.self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        lastPoint = touch.location(in: self.imgView)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(self.imgView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round) //선의 끝 모양을 둥글게 설정
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        let touch = touches.first! as UITouch
        let currentPoint = touch.location(in: self.imgView)
        
        self.imgView.image?.draw(in: CGRect(x: 0, y: 0,
                                            width: self.imgView.frame.size.width,
                                            height: self.imgView.frame.size.height))
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: currentPoint.x, y: currentPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        
        self.imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        lastPoint = currentPoint
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(self.imgView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        self.imgView.image?.draw(in: CGRect(x: 0, y: 0,
                                            width: self.imgView.frame.size.width,
                                            height: self.imgView.frame.size.height))
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        
        self.imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake{
            self.imgView.image = nil
        }
    }
}

