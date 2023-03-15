//
//  Last_Page.swift
//  TapOnTheNumber
//
//  Created by R86 on 17/02/23.
//


import UIKit


class Last_Page: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var tapOnLable: UILabel!
    var time = Timer()
    var freq = 0.10
    var range = 50
    var null = 0
    var arr = [1,2,3,4,5,6,7,8,9,10,11,12]
    var arr2 = [1,2,3,4,5,6,7,8,9,10,11,12]
    
    @IBOutlet weak var pointLable: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pointLable.text = "0"
        progress()
        arr.shuffle()
    }
    
    func progress() {
        time.invalidate()
        
        var randomTime : Float = 1.0
        self.progressBar.progress = randomTime
        time = Timer.scheduledTimer(withTimeInterval: freq, repeats: true, block: { (_) in
            randomTime -= 0.015
            self.progressBar.progress = randomTime
            if self.progressBar.progress == 0.0  {
                self.showalert(message:" Time is up !")
                self.time.invalidate()
            }
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        cell.numberLable.text = "\(arr[indexPath.row])"
        cell.layer.cornerRadius = 20
        cell.layer.masksToBounds = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var a = arr2.randomElement()?.description
        tapOnLable.text = a
        if a == select(indexPath.row) {
            
        }         
        
        
        arr.shuffle()
        plushScore()
        collectionView.reloadData()
        progress()
    }
    
    func plushScore() {
        null = null + 1
        pointLable.text = "\(null)"
        progress()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 90)
    }
    
    func showalert(message:String) {
        let alert = UIAlertController.init(title: "Oops!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Try again !", style: .default, handler: { _ in
            self.collectionView.reloadData()
            self.progress()
        }))
        alert.addAction(UIAlertAction.init(title: "Mods !", style: .destructive, handler: { _ in
            self.navigationForMod()
        }))
        present(alert, animated:true, completion: nil)
    }
    
    func navigationForMod() {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "Cattegary") as! Cattegary
        
        navigationController?.pushViewController(navigation, animated: true)
    }
}
