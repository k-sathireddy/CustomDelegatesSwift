//
//  SecondViewController.swift
//  CustomDelegateSwift
//
//  Created by Enterpi mini mac on 12/1/16.
//  Copyright © 2016 Enterpi mini mac. All rights reserved.
//

import UIKit

protocol SecondViewControllerProtocol {
    func changeMaritalStatus(type: String)
}

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var maritalStatusTableView: UITableView!
    
    var maritalStatusArray: [String] = []
    
    var statusDelegate  : SecondViewControllerProtocol? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        maritalStatusArray = ["Single","Married","Divorced"]
        self.maritalStatusTableView.register(UITableViewCell.self, forCellReuseIdentifier: "maritalStatuscell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let maritalStatusInfoCell = tableView.dequeueReusableCell(withIdentifier: "maritalStatuscell", for: indexPath)
        let infoLabel: UILabel = UILabel.init(frame: CGRect(x: 10, y: 5, width: 250, height: 50))
        infoLabel.text = maritalStatusArray[indexPath.row]
        maritalStatusInfoCell.addSubview(infoLabel)
        return maritalStatusInfoCell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        statusDelegate?.changeMaritalStatus(type: maritalStatusArray[indexPath.row])
        self.dismiss(animated: true, completion: nil)
    }

}
