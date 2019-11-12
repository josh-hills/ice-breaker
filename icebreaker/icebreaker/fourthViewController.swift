//
//  fourthViewController.swift
//  icebreaker
//
//  Created by Josh Hills on 2018-01-23.
//  Copyright © 2018 Josh Hills. All rights reserved.
//

import UIKit

class fourthViewController: UIViewController {
    
    @IBOutlet var helpView: UIView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet weak var helpViewLabel: UILabel!
   
    
    var effect:UIVisualEffect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        effect = visualEffectView.effect
        visualEffectView.effect=nil
        helpView.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
        if selectedHobbies.isEmpty {
            helpViewLabel.text = "Welcome to icebreaker! First, selected 10 hobbies that corilate best with you"
            animateIn()
           
        } else {
            helpViewLabel.text = "Now that you have selected your hobbies, find someone and compare your interests!"
            animateIn()
        }
    }
    @IBAction func dismissPopup(_ sender: Any) {
        animateOut()
    }
    
    func animateIn() {
        self.view.addSubview(helpView)
        helpView.center = self.view.center
        helpView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        helpView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.visualEffectView.effect = self.effect
            self.helpView.alpha = 1
            self.helpView.transform = CGAffineTransform.identity
        }
    }
    
    func animateOut() {
        UIView.animate(withDuration: 0.3, animations: {
            self.helpView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.helpView.alpha = 0
            self.visualEffectView.effect = nil
            
        }) { (success:Bool) in
            self.helpView.removeFromSuperview()
        }
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
