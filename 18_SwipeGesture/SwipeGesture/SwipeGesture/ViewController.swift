//
//  ViewController.swift
//  SwipeGesture
//
//  Created by 유혜빈 on 2022/10/11.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var upImgView: UIImageView!
    @IBOutlet weak var leftImgView: UIImageView!
    @IBOutlet weak var rightImgView: UIImageView!
    @IBOutlet weak var downImgView: UIImageView!
    
    var up = [UIImage]()
    var left = [UIImage]()
    var right = [UIImage]()
    var down = [UIImage]()
    
    let numberOfTouchs = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        up.append(UIImage(named: "arrow-up-black.png")!)
        up.append(UIImage(named: "arrow-up-red.png")!)
        up.append(UIImage(named: "arrow-up-green.png")!)
        
        left.append(UIImage(named: "arrow-left-black.png")!)
        left.append(UIImage(named: "arrow-left-red.png")!)
        left.append(UIImage(named: "arrow-left-green.png")!)
        
        right.append(UIImage(named: "arrow-right-black.png")!)
        right.append(UIImage(named: "arrow-right-red.png")!)
        right.append(UIImage(named: "arrow-right-green.png")!)
        
        down.append(UIImage(named: "arrow-down-black.png")!)
        down.append(UIImage(named: "arrow-down-red.png")!)
        down.append(UIImage(named: "arrow-down-green.png")!)
        
        self.upImgView.image = up[0]
        self.leftImgView.image = left[0]
        self.rightImgView.image = right[0]
        self.downImgView.image = down[0]
        
        //swipe gesture
        let swipeUp = UISwipeGestureRecognizer(target: self,
                                               action: #selector(respondToSwipeGesture(_:)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self,
                                               action: #selector(respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self,
                                               action: #selector(respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeDown = UISwipeGestureRecognizer(target: self,
                                               action: #selector(respondToSwipeGesture(_:)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeUpMulti = UISwipeGestureRecognizer(target: self,
                                               action: #selector(respondToSwipeGestureMulti(_:)))
        swipeUpMulti.direction = UISwipeGestureRecognizer.Direction.up
        swipeUpMulti.numberOfTouchesRequired = numberOfTouchs
        self.view.addGestureRecognizer(swipeUpMulti)
        
        let swipeLeftMulti = UISwipeGestureRecognizer(target: self,
                                               action: #selector(respondToSwipeGestureMulti(_:)))
        swipeLeftMulti.direction = UISwipeGestureRecognizer.Direction.left
        swipeLeftMulti.numberOfTouchesRequired = numberOfTouchs
        self.view.addGestureRecognizer(swipeLeftMulti)
        
        let swipeRightMulti = UISwipeGestureRecognizer(target: self,
                                               action: #selector(respondToSwipeGestureMulti(_:)))
        swipeRightMulti.direction = UISwipeGestureRecognizer.Direction.right
        swipeRightMulti.numberOfTouchesRequired = numberOfTouchs
        self.view.addGestureRecognizer(swipeRightMulti)
        
        let swipeDownMulti = UISwipeGestureRecognizer(target: self,
                                               action: #selector(respondToSwipeGestureMulti(_:)))
        swipeDownMulti.direction = UISwipeGestureRecognizer.Direction.down
        swipeDownMulti.numberOfTouchesRequired = numberOfTouchs
        self.view.addGestureRecognizer(swipeDownMulti)
    }
    
    @objc func respondToSwipeGesture(_ gestrue: UIGestureRecognizer){
        if let swipeGesture = gestrue as? UISwipeGestureRecognizer{
            self.upImgView.image = up[0]
            self.leftImgView.image = left[0]
            self.rightImgView.image = right[0]
            self.downImgView.image = down[0]
            
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.up:
                self.upImgView.image = up[1]
            case UISwipeGestureRecognizer.Direction.left:
                self.leftImgView.image = left[1]
            case UISwipeGestureRecognizer.Direction.right:
                self.rightImgView.image = right[1]
            case UISwipeGestureRecognizer.Direction.down:
                self.downImgView.image = down[1]
            default:
                break
            }
        }
    }
    
    @objc func respondToSwipeGestureMulti(_ gestrue: UIGestureRecognizer){
        if let swipeGesture = gestrue as? UISwipeGestureRecognizer{
            self.upImgView.image = up[0]
            self.leftImgView.image = left[0]
            self.rightImgView.image = right[0]
            self.downImgView.image = down[0]
            
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.up:
                self.upImgView.image = up[2]
            case UISwipeGestureRecognizer.Direction.left:
                self.leftImgView.image = left[2]
            case UISwipeGestureRecognizer.Direction.right:
                self.rightImgView.image = right[2]
            case UISwipeGestureRecognizer.Direction.down:
                self.downImgView.image = down[2]
            default:
                break
            }
        }
    }


}

