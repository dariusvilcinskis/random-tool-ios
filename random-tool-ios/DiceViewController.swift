//
//  DiceViewController.swift
//  random-tool-ios
//
//  Created by Darius Vilcinskis on 06/11/2017.
//  Copyright © 2017 Darius Vilcinskis. All rights reserved.
//

import UIKit

class DiceViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //MARK: private
    private var dice = [UIImage]()
    
    private var numberOfDice = 6 {
        didSet {
            numberOfDiceLabel.text = numberOfDice.description
        }
    }
    
    private func getDiceImage(numberOfDice: Int) -> UIImage? {
        switch (numberOfDice) {
        case 1:
            return UIImage(named: "dice1")
        case 2:
            return UIImage(named: "dice2")
        case 3:
            return UIImage(named: "dice3")
        case 4:
            return UIImage(named: "dice4")
        case 5:
            return UIImage(named: "dice5")
        case 6:
            return UIImage(named: "dice6")
        default:
            return nil
        }
    }
    
    //MARK: actions
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numberOfDice = Int(sender.value)
    }
    
    @IBAction func randomizeAction(_ sender: UIButton) {
        dice = [UIImage]()
        for _ in 1...numberOfDice {
            let randomDice = Int(arc4random()) % 6 + 1
            guard let image = getDiceImage(numberOfDice: randomDice) else {
                continue
            }
            dice.append(image)
        }
        collectionView.reloadData()
    }
    
    //MARK: outlets
    @IBOutlet weak var numberOfDiceLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dice.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! DiceCollectionViewCell
        
        cell.imidzas.image = dice[indexPath.row]
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Dice Roll"

        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
