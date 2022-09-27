//
//  AddViewController.swift
//  tabelViewController
//
//  Created by 유혜빈 on 2022/09/24.
//

import UIKit

class AddViewController: UIViewController {
    @IBOutlet weak var addTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tapAddButton(_ sender: UIButton) {
        items.append(addTextField.text!)
        itemsImage.append("clock.png")
        self.addTextField.text = ""
        
        _ = navigationController?.popViewController(animated: true)
    }
}
