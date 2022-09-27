//
//  ViewController.swift
//  pageControl-mission
//
//  Created by 유혜빈 on 2022/09/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageControl.numberOfPages = 10
        self.pageControl.currentPage = 0
        self.pageControl.pageIndicatorTintColor = UIColor.gray
        self.pageControl.currentPageIndicatorTintColor = UIColor.red
        
        self.numberLabel.text = String(self.pageControl.currentPage+1)
    }

    @IBAction func changePage(_ sender: UIPageControl) {
        self.numberLabel.text = String(self.pageControl.currentPage+1)
    }
}

