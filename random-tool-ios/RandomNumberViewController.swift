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
    
    //MARK: private
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
    }
    
    @IBAction func changedFromTextBox(_ sender: UITextField) {
        fromStepper.value = Double(sender.text!)!
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
        answerLabel.text = 5.description
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
