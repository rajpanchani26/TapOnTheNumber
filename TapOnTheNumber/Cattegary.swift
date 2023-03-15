//
//  Cattegary.swift
//  TapOnTheNumber
//
//  Created by R86 on 16/02/23.
//

import UIKit

class Cattegary: UIViewController {

    var time = Timer()
    
    
    @IBOutlet weak var easyButtonOutlet: UIButton!
   
    @IBOutlet weak var hardButtonOutlet: UIButton!
    
    @IBOutlet weak var mediumButtonOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        easyButtonOutlet.layer.cornerRadius = 20
        mediumButtonOutlet.layer.cornerRadius = 20
        hardButtonOutlet.layer.cornerRadius = 20
        
        easyButtonOutlet.layer.masksToBounds = true
        mediumButtonOutlet.layer.masksToBounds = true
        hardButtonOutlet.layer.masksToBounds = true
        
        
    }
    
    @IBAction func easyButtonAction(_ sender: UIButton) {
        navigationForEasy()
    }
    @IBAction func mediumButtonAction(_ sender: UIButton) {
        navigationForMedium()
    }
    
    @IBAction func hardButtonAction(_ sender: UIButton) {
       navigationForHard()
    }
    func navigationForEasy() {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "Last_Page") as! Last_Page
        navigation.freq = 0.10
        navigation.range = 50
        navigationController?.pushViewController(navigation, animated: true)
    }
    func navigationForMedium() {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "Last_Page") as! Last_Page
        navigation.freq = 0.07
        navigation.range = 99
        navigationController?.pushViewController(navigation, animated: true)
    }
    func navigationForHard() {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "Last_Page") as! Last_Page
        navigation.freq = 0.05
        navigation.range = 150
        navigationController?.pushViewController(navigation, animated: true)
    }
    
}
