//
//  ViewController.swift
//  Alert
//
//  Created by 유혜빈 on 2022/09/28.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    
    var isLampOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imgView.image = UIImage(named: "lamp-on.png")
    }

    @IBAction func tapOnButton(_ sender: UIButton) {
        if isLampOn{
            let lampOnAlert = UIAlertController(title: "경고",
                                               message: "현재 램프가 켜져있습니다.",
                                               preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "네",
                                         style: UIAlertAction.Style.default)
            lampOnAlert.addAction(okAction)
            
            present(lampOnAlert, animated: true)
        }else{
            self.imgView.image = UIImage(named: "lamp-on.png")
            isLampOn = true
        }
    }
    
    @IBAction func tapOffButton(_ sender: UIButton) {
        if isLampOn{
            let lampOnAlert = UIAlertController(title: "램프 끄기",
                                               message: "램프를 끄시겠습니까?",
                                               preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "네",
                                         style: UIAlertAction.Style.default,
                                         handler: { Action in
                self.imgView.image = UIImage(named: "lamp-off.png")
                self.isLampOn = false
            })
            let cancelAction = UIAlertAction(title: "아니오",
                                         style: UIAlertAction.Style.default,
                                         handler: nil)
            
            lampOnAlert.addAction(okAction)
            lampOnAlert.addAction(cancelAction)
            
            present(lampOnAlert, animated: true)
        }else{
            let lampOffAlert = UIAlertController(title: "경고",
                                               message: "현재 램프가 꺼져있습니다.",
                                               preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "네",
                                         style: UIAlertAction.Style.default)
            lampOffAlert.addAction(okAction)
            
            present(lampOffAlert, animated: true)
        }
    }
    
    @IBAction func tapRemoveButton(_ sender: UIButton) {
        let lampRemoveAlert = UIAlertController(title: "램프 제거",
                                           message: "램프를 제거하시겠습니까?",
                                           preferredStyle: UIAlertController.Style.alert)
        
        let offAction = UIAlertAction(title: "아니오, 끕니다(off)",
                                     style: UIAlertAction.Style.default,
                                      handler: {Action in
            self.imgView.image = UIImage(named: "lamp-off.png")
            self.isLampOn = false
        })
        let onAction = UIAlertAction(title: "아니오, 켭니다(on)",
                                     style: UIAlertAction.Style.default,
                                      handler: {Action in
            self.imgView.image = UIImage(named: "lamp-on.png")
            self.isLampOn = true
        })
        let removeAction = UIAlertAction(title: "네, 제거합니다.",
                                     style: UIAlertAction.Style.default,
                                      handler: {Action in
            self.imgView.image = UIImage(named: "lamp-remove.png")
            self.isLampOn = false
        })
        
        
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        
        present(lampRemoveAlert, animated: true)
    }
}

