//
//  ViewController.swift
//  SwipeGesture-Mission
//
//  Created by 유혜빈 on 2022/10/11.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var imgPageControl: UIPageControl!
    
    var images = ["01.png", "02.png", "03.png", "04.png", "05.png", "06.png"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imgPageControl.numberOfPages = images.count
        self.imgPageControl.currentPage = 0
        self.imgPageControl.pageIndicatorTintColor = UIColor.gray
        self.imgPageControl.currentPageIndicatorTintColor = UIColor.red
        
        self.imgView.image = UIImage(named: images[0])
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(_ :)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(_ :)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }

    @IBAction func imgChange(_ sender: UIPageControl) {
        self.imgView.image = UIImage(named: images[self.imgPageControl.currentPage])
    }
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left:
                if self.imgPageControl.currentPage < self.imgPageControl.numberOfPages - 1{
                    self.imgPageControl.currentPage += 1
                }
            case UISwipeGestureRecognizer.Direction.right:
                if self.imgPageControl.currentPage > 0{
                    self.imgPageControl.currentPage -= 1
                }
            default:
                break
            }
            
            self.imgView.image = UIImage(named: images[self.imgPageControl.currentPage])
        }
    }
    
}

