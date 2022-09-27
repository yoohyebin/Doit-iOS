//
//  DetailViewController.swift
//  tabelViewController
//
//  Created by 유혜빈 on 2022/09/24.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var tapDetailLabel: UILabel!
    
    var receiveItemString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tapDetailLabel.text = receiveItemString
    }
    func reciveItem(_ item: String){
        receiveItemString = item
    }
    
}
