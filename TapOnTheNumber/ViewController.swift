//
//  ViewController.swift
//  TapOnTheNumber
//
//  Created by R86 on 16/02/23.
//

import UIKit

class ViewController: UIViewController {

  
    var time = Timer()
    
    @IBOutlet weak var stratButtonOultlet: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        stratButtonOultlet.layer.cornerRadius = 20
        stratButtonOultlet.layer.masksToBounds = true
        progressBar.progress = 0.0
    }
    
    @IBAction func startButtonAction(_ sender: Any) {
        
        var randomTime : Float = 0.0
        self.progressBar.progress = randomTime
        time = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: { (_) in
            randomTime += 0.05
            self.progressBar.progress = randomTime
            if self.progressBar.progress == 1.0{
                
                self.time.invalidate()
                self.navigation()
            }
        })
       
    }
    func navigation() {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "Cattegary") as! Cattegary
        navigationController?.pushViewController(navigation, animated: true)
    }

    
}

