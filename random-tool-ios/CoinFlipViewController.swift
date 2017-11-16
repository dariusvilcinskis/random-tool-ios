//
//  CoinFlipViewController.swift
//  random-tool-ios
//
//  Created by Darius Vilcinskis on 07/11/2017.
//  Copyright © 2017 Darius Vilcinskis. All rights reserved.
//

import UIKit

class CoinFlipViewController: UIViewController {

    //MARK: private
    private func flipCoin() {
        let decision = Int(arc4random()) % 2 == 1
        
        if decision {
            coinImage.image = UIImage(named: "tails")
        }
        else {
            coinImage.image = UIImage(named: "heads")
        }
    }
    
    //MARK: actions
    @IBAction func flip(_ sender: UIButton) {
        flipCoin()
    }
    
    //MARK: outlets
    @IBOutlet weak var coinImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Coin Flip"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
