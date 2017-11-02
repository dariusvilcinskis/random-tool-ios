//
//  ViewController.swift
//  random-tool-ios
//
//  Created by Darius Vilcinskis on 31/10/2017.
//  Copyright © 2017 Darius Vilcinskis. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ShellController {
    @IBOutlet weak var nicerDicer: UIView!
    

    
    func changeShellContent(MenuItem: MenuItem) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "coinFlipView") as UIViewController
        for view in nicerDicer.subviews {
            view.removeFromSuperview()
        }
        
        if nicerDicer == nil {
            return
        }
        
        nicerDicer.addSubview(nextViewController.view)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nicerDicer.addSubview(UIView())
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

