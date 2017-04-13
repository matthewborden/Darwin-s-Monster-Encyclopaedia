//
//  DataViewController.swift
//  Darwin’s Monster Encyclopaedia
//
//  Created by Matthew Borden on 3/4/17.
//  Copyright © 2017 Matthew Borden. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {
    var dataObject = ""

    @IBOutlet var name: UITextField!
    @IBOutlet var age: UITextField!
    @IBOutlet var attackPower: UITextField!
    @IBOutlet var species: UITextField!
    @IBOutlet var health: UITextField!
    
    @IBOutlet var summaryText: UILabel!
    
    var currentMonster: Monster!
    
    @IBAction func updateButtonClicked(_ sender: Any) {
        var messageString = ""
        
        if currentMonster == nil {
            return
        }

        if age.text != "" && Int(age.text!) == nil {
            messageString = "Please enter a number for Age."
        } else if attackPower.text != "" && Int(attackPower.text!) == nil {
            messageString = "Please enter a number for Attack Power."
        } else if health.text != "" && Int(health.text!) == nil {
            messageString = "Please enter a number for Health."
        }

        if name.text != "" {
            currentMonster.name = name.text
        }

        if age.text != "" {
            currentMonster.age = Int(age.text!)
        }
        
        if species.text != "" {
            currentMonster.species = species.text
        }
        
        if attackPower.text != "" {
            currentMonster.attackPower = Int(attackPower.text!)
        }
        
        if health.text != "" {
            currentMonster.health = Int(health.text!)
        }

        summaryText.text = currentMonster.summary()

        if messageString != "" {
            //Make alert
            let alertController = UIAlertController(title: "Alert", message: messageString, preferredStyle: UIAlertControllerStyle.alert)
            //Add button to alert
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }
        
        name.text = ""
        age.text = ""
        species.text = ""
        attackPower.text = ""
        health.text = ""
    }
    
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        var messageString = ""
        
        if name.text != "" && age.text != "" && species.text != "" && attackPower.text != "" && health.text != "" {
            if Int(age.text!) == nil {
                messageString = "Please enter a number for Age."
            } else if Int(attackPower.text!) == nil {
                messageString = "Please enter a number for Attack Power."
            } else if Int(health.text!) == nil {
                messageString = "Please enter a number for Health."
            } else {
                currentMonster = Monster(name: name.text!, age: Int(age.text!)!, species: species.text!, attackPower: Int(attackPower.text!)!, health: Int(health.text!)!)
                summaryText.text = currentMonster.summary()
            }
        } else {
            messageString = "Please fill in all fields!"
        }
        
        if messageString != "" {
            //Make alert
            let alertController = UIAlertController(title: "Alert", message: messageString, preferredStyle: UIAlertControllerStyle.alert)
            //Add button to alert
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }
        
        name.text = ""
        age.text = ""
        species.text = ""
        attackPower.text = ""
        health.text = ""
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
}

