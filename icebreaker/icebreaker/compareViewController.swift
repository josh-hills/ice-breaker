//
//  compareViewController.swift
//  icebreaker
//
//  Created by Josh Hills on 2018-01-22.
//  Copyright © 2018 Josh Hills. All rights reserved.
//

import UIKit

class compareViewController: UIViewController {

    @IBOutlet weak var simmilar: UILabel!
    
// Creates a new string of the simmilar hobbies, if there are no simmilar hobbies it will pick one at random for the people to talk about
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let otherHobbiesStr = otherHobbies.components(separatedBy: ", ")

        let commonInterests  = otherHobbiesStr.filter { (string) -> Bool in  //common interests are filtered
            return selectedHobbies.contains(string)
        }
        let commonInsterestsStr:String = commonInterests.joined(separator: ", ")
        if commonInsterestsStr.isEmpty {
            let randomHobby = Int(arc4random_uniform(UInt32(10)))
            let hobby = otherHobbiesStr[randomHobby]
            simmilar.text = "You have no simmilar hobbies, \(hobby) was randomally selected"
        } else {
            simmilar.text = "You both like \(commonInsterestsStr)"
        }
    }
        
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
