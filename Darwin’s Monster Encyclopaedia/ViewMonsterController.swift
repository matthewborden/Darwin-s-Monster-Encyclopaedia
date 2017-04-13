//
//  ViewMonsterController.swift
//  Darwin’s Monster Encyclopaedia
//
//  Created by Matthew Borden on 13/4/17.
//  Copyright © 2017 Matthew Borden. All rights reserved.
//

import UIKit

class ViewMonsterController: UIViewController {
    var monster : Monster?
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var summaryText: UITextView!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var speciesLabel: UILabel!
    @IBOutlet var healthLabel: UILabel!
    @IBOutlet var attackPowerLabel: UILabel!
    @IBOutlet var randomAttackLabel: UILabel!

    required init?(coder aDecoder: NSCoder) {
        if monster == nil {
            monster = Monster(name: "Mike the Monster", age: 30, species: "WONDERSOURAS", attackPower: 20, health: 348297)
        }
        

        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameLabel!.text = monster?.name!
        summaryText!.text = monster!.summary()
        ageLabel!.text = String(monster!.age!)
        speciesLabel!.text = monster!.species!
        healthLabel!.text = String(monster!.health!)
        attackPowerLabel!.text = String(monster!.attackPower!)
        randomAttackLabel!.text = String(monster!.randomAttack())
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
