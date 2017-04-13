//
//  Monster.swift
//  Darwin’s Monster Encyclopaedia
//
//  Created by Matthew Borden on 3/4/17.
//  Copyright © 2017 Matthew Borden. All rights reserved.
//

import UIKit

class Monster: NSObject {
    var name: String?
    var age: Int?
    var species: String?
    var attackPower: Int?
    var health: Int?
    
    init(name: String, age:Int, species: String, attackPower: Int, health: Int){
        self.name = name
        self.age = age
        self.species = species;
        self.attackPower = attackPower;
        self.health = health;
    }
    
    func summary() -> String {
        return "The Mosters name is \(name!). He is \(age!) years old and is a \(species!). Currently he has an attack power of \(attackPower!) and a health of \(health!)";
    }
    
    func randomAttack() -> Int {
        let random:UInt32 = arc4random_uniform(100);
        return attackPower! + Int(random);
    }
}
