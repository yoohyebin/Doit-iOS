//
//  ViewController.swift
//  NavigationController
//
//  Created by 유혜빈 on 2022/10/05.
//

import UIKit

class ViewController: UIViewController, EditDelegate{
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    
    var isOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imgView.image = UIImage(named: "lamp_on.png")
    }
    
    func didMessageEditDone(_ controller: EditViewController, _ message: String) {
        self.textField.text = message
    }
    
    func didLampOnOffDone(_ controller: EditViewController, _ isOn: Bool) {
        if isOn{
            self.imgView.image = UIImage(named: "lamp_on.png")
            self.isOn = true
        }else{
            self.imgView.image = UIImage(named: "lamp_off.png")
            self.isOn = false
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton"{
            editViewController.textValue = "segue: use button"
        }else if segue.identifier == "editBarButton"{
            editViewController.textValue = "segue: use bar button"
        }
        editViewController.message = self.textField.text!
        editViewController.isOn = isOn
        editViewController.delegate = self
    }

}

