//
//  ListRandomizerViewController.swift
//  random-tool-ios
//
//  Created by Darius Vilcinskis on 07/11/2017.
//  Copyright © 2017 Darius Vilcinskis. All rights reserved.
//

import UIKit

class ListRandomizerViewController: UIViewController {
    
    //MARK: private
    private func randomizeList(text: String) -> String {
        
        var lines = [String]()
        text.enumerateLines {
            (line, _) -> () in lines.append(line)
        }
        
        for i in 0...lines.count - 1 {
            let j = Int(arc4random_uniform(UInt32(lines.count)))
            guard (j != i) else { continue }
            lines.swapAt(j, i)
        }
        
        var result = ""
        for line in lines {
            result.append(line)
            result.append("\n")
        }
        
        result.removeLast()
        
        return result
    }

    //MARK: actions
    @IBAction func randomize(_ sender: UIButton) {
        guard !text.text.isEmpty else {
            return
        }
        
        text.text = randomizeList(text: text.text)
    }
    
    //MARK: outlets
    @IBOutlet weak var text: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "List Randomizer"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
