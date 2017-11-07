//
//  WinnerViewController.swift
//  random-tool-ios
//
//  Created by Darius Vilcinskis on 07/11/2017.
//  Copyright © 2017 Darius Vilcinskis. All rights reserved.
//

import UIKit

class WinnerViewController: UIViewController {

    //MARK: outlets
    @IBOutlet weak var listTextBox: UITextView!
    @IBOutlet weak var winnerLabel: UILabel!
    
    //MARK: actions
    @IBAction func selectWinner(_ sender: UIButton) {
        let text = listTextBox.text
        var names = [String]()
        text?.enumerateLines { (line, _) -> () in
            names.append(line)
        }
        
        guard names.count > 0 else {
            winnerLabel.isHidden = true
            return
        }
        
        let randomLineIndex = Int(arc4random()) % names.count
        
        winnerLabel.text = names[randomLineIndex]
        winnerLabel.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
