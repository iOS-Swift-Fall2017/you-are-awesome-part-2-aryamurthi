//
//  ViewController.swift
//  You Are Awesome
//
//  Created by Arya Murthi on 8/28/17.
//  Copyright © 2017 Arya Murthi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var reallyCoolLabel: UILabel!
    
    var index = -1
    var newIndex = 0
    let messages = ["You aiight.",
                    "I suppose you have a few redeeming qualities.",
                    "You not completely bad.",
                    "When the genius bar needs help, they go to a professional instead of trusting their resources with an untrained, inexperienced person like yourself.",
                    "You're only human."]
    
    //Change label to message output
    @IBAction func showMessageButton(_ sender: UIButton) {
        
        repeat {
            newIndex = Int(arc4random_uniform(UInt32(messages.count)))
        } while index == newIndex
        
        index = newIndex
        reallyCoolLabel.text = messages[index]
        
        
    }
    
    //This code executes when the view controller loads
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

