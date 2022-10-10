//
//  ViewController.swift
//  pageControl-Mission
//
//  Created by 유혜빈 on 2022/10/05.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var pageLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageControl.numberOfPages = 10
        self.pageControl.currentPage = 0
        self.pageControl.pageIndicatorTintColor = UIColor.gray
        self.pageControl.currentPageIndicatorTintColor = UIColor.blue
        
        self.pageLabel.text = "1"
    }

    @IBAction func changePage(_ sender: UIPageControl) {
        self.pageLabel.text = String(Int(exactly: self.pageControl.currentPage)! + 1)
    }
    
}

