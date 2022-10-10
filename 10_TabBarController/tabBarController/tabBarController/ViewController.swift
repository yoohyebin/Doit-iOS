//
//  ViewController.swift
//  tabBarController
//
//  Created by 유혜빈 on 2022/10/05.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapMoveImageViewButton(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func tapMoveDatePickerButton(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
}

