//
//  ViewController.swift
//  icebreaker
//
//  Created by Josh Hills on 2017-12-29.
//  Copyright © 2017 Josh Hills. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var myImageView: UIImageView! //displays the qrcode
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // when the view loads we turn the array of selected hobbies into a string with a seperator, it then turns this string into an image of an array and displays the image in the text box
        let myString:String = selectedHobbies.joined(separator: ", ")
        print(selectedHobbies)
        print(myString)
        view.endEditing(true)
        //data is a constant
        let data = myString.data(using: .ascii, allowLossyConversion:  false)
        let filter = CIFilter(name: "CIQRCodeGenerator")
        filter?.setValue(data, forKey: "inputMessage")
        
        let ciImage = filter?.outputImage
        
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let transformImage = ciImage?.transformed(by: transform)
        
        let image = UIImage(ciImage: transformImage!)
        myImageView.image = image
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

