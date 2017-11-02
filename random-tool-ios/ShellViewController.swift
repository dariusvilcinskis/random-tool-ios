//
//  ShellViewController.swift
//  random-tool-ios
//
//  Created by Darius Vilcinskis on 01/11/2017.
//  Copyright © 2017 Darius Vilcinskis. All rights reserved.
//

import UIKit

class ShellViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: private
    private var mainController:ShellController? = nil
    
    //MARK: properties
    let menuItems:[MenuItem] = [MenuItem.randomNumber,
                                MenuItem.diceRolls,
                                MenuItem.coinFlip,
                                MenuItem.listRandomizer,
                                MenuItem.listRandomizer,
                                MenuItem.winnerSelection,
                                MenuItem.decision]
    
    @IBOutlet weak var shellTableView: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shellCell") as! ShellTableViewCell
        
        cell.MenuLabel.text = menuItems[indexPath.row].name
        cell.MenuImage.image = UIImage(named: menuItems[indexPath.row].iconName)
  
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mainController?.changeShellContent(MenuItem: .coinFlip)
    }
        
    func GetMainViewController() -> UIViewController
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "mainView") as UIViewController
        //viewas.present(nextViewController, animated:true, completion:nil)
        
        
        return nextViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.mainController = GetMainViewController() as? ShellController
        
        shellTableView.delegate = self
        shellTableView.dataSource = self
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
