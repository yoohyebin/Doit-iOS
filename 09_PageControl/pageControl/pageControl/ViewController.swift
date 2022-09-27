//
//  ViewController.swift
//  pageControl
//
//  Created by 유혜빈 on 2022/09/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var images = ["01.png", "02.png", "03.png", "04.png", "05.png", "06.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageControl.numberOfPages = images.count
        self.pageControl.currentPage = 0
        self.pageControl.pageIndicatorTintColor = UIColor.green
        self.pageControl.currentPageIndicatorTintColor = UIColor.red
        self.imgView.image = UIImage(named: images[0])
    }

    @IBAction func changePage(_ sender: UIPageControl) {
        self.imgView.image = UIImage(named: images[self.pageControl.currentPage])
    }
    
}

