//
//  RandomNumberViewController.swift
//  random-tool-ios
//
//  Created by Darius Vilcinskis on 05/11/2017.
//  Copyright © 2017 Darius Vilcinskis. All rights reserved.
//

import UIKit

class RandomNumberViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    //MARK: outlets
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var fromStepper: UIStepper!
    @IBOutlet weak var toStepper: UIStepper!
    @IBOutlet weak var precisionLabel: UILabel!
    @IBOutlet weak var fromTextBox: UITextField!
    @IBOutlet weak var toTextBox: UITextField!
    @IBOutlet weak var answerLabelTitle: UILabel!
    
    //MARK: private functions
    private func calculateRandomNumber(from:Int, to:Int, precision:Double) -> Double {
        
        guard(fromNumber > toNumber) else {
            return Double(toNumber)
        }
        
        let maxDouble = Double(UInt32.max)
        var trunc = Double(arc4random()) / maxDouble
        let prec = 1/precision
        trunc = round(trunc*(prec)) / prec
        
        if (precision == 1 && trunc >= 0.5)
        {
            trunc = 1.0
        }
        
        let lenght:UInt32 = UInt32(toNumber - fromNumber)
        let num = arc4random() % (lenght) + UInt32(fromNumber)
    
        return trunc + Double(num)
    }
    
    //MARK: private properties
    private var precision = 1.0
    {
        didSet {
            precisionLabel.text = precision.description
        }
    }
    
    private var fromNumber = 1
    {
        didSet {
            fromTextBox.text = fromNumber.description
        }
    }
    
    private var toNumber = 15
    {
        didSet {
            toTextBox.text = toNumber.description
        }
    }
    
    //MARK: actions
    @IBAction func changedToTextBox(_ sender: UITextField) {
        toStepper.value = Double(sender.text!)!
        toStepper(toStepper)
    }
    
    @IBAction func changedFromTextBox(_ sender: UITextField) {
        fromStepper.value = Double(sender.text!)!
        fromStepper(fromStepper)
    }
    @IBAction func toStepper(_ sender: UIStepper) {
        toNumber = Int(sender.value)
    }
    
    @IBAction func fromStepper(_ sender: UIStepper) {
        fromNumber = Int(sender.value)
    }
    
    @IBAction func precisionStepper(_ sender: UIStepper) {
        self.precision = 10 / pow(10, sender.value)
    }
    
    @IBAction func randomize(_ sender: UIButton) {
        answerLabel.text = calculateRandomNumber(from: fromNumber, to: toNumber, precision: precision).description
        
        answerLabel.isHidden = false
        answerLabelTitle.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.toTextBox.delegate = self
        self.fromTextBox.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
