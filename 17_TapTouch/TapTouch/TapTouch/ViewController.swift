//
//  ViewController.swift
//  TapTouch
//
//  Created by 유혜빈 on 2022/10/10.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var tapCountLabel: UILabel!
    @IBOutlet weak var touchCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    //터치 시작
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        self.messageLabel.text = "Touches Began"
        self.tapCountLabel.text = String(touch.tapCount)
        self.touchCountLabel.text = String(touches.count)
    }
    //터치된 손가락이 움직임
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        self.messageLabel.text = "Touches Moved"
        self.tapCountLabel.text = String(touch.tapCount)
        self.touchCountLabel.text = String(touches.count)
    }
    //화면에서 손가락을 뗌
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        self.messageLabel.text = "Touches Began"
        self.tapCountLabel.text = String(touch.tapCount)
        self.touchCountLabel.text = String(touches.count)
    }

}

