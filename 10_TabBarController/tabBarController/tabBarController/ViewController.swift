//
//  ViewController.swift
//  tabBarController
//
//  Created by 유혜빈 on 2022/09/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapMoveImageViewButton(_ sender: Any) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func tapMoveDatePickerView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
}

