//
//  ErrorViewController.swift
//  MiraclePills
//
//  Created by Ravi Pinamacha on 7/6/17.
//  Copyright © 2017 Ravi Pinamacha. All rights reserved.
//

import UIKit

class ErrorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        self.showAnimate()
    }

//    @IBAction func closeButtonPressed(_ sender: Any) {
//        self.removeAnimate()
//    }
    @IBAction func imagePressed(_ sender: Any) {
        self.removeAnimate()
    }
    func showAnimate() {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.2, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    func removeAnimate() {
        UIView.animate(withDuration: 0.2, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        })
    }
}
