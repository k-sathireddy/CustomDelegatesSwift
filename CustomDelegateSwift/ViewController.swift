//
//  ViewController.swift
//  CustomDelegateSwift
//
//  Created by Enterpi mini mac on 12/1/16.
//  Copyright © 2016 Enterpi mini mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SecondViewControllerProtocol {

    @IBOutlet weak var userInfoTableView: UITableView!
    
    var userInfoArray: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        userInfoArray = ["Marital Status","Canton","Commune","Religion"]
       self.userInfoTableView?.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userInfoCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        userInfoCell.textLabel?.text = userInfoArray[indexPath.row]
        if indexPath.row == 0{
            userInfoCell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        }
        return userInfoCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            let secondVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewControllerIdentifier") as! SecondViewController
            secondVC.statusDelegate = self
            self.navigationController?.present(secondVC, animated: true, completion: nil)
        }
    }

    func changeMaritalStatus(type: String){
        let  maritalStatusCell = userInfoTableView.cellForRow(at: IndexPath(row:0 , section:0))
        maritalStatusCell?.textLabel?.text = String("Marital Status: \(type)")
    }
}

