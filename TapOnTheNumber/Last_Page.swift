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
    var point = 0
    var arr = [11,52,43,84,95,26,37,68,79,1,61,32]
    var ans = 0
    var score = 0
    var null = 0
    var highScore = UserDefaults.standard.integer(forKey: "highScore")
    
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var pointLable: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var collectionView: UICollectionView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        pointLable.text = String(0)
        progress()
        setData()
        scor()
        score = point
        
    }
    
    func scor(){
        if score > highScore{
            highScore = score
        }
    }
    
    func setData() {
        ans = [11,52,43,84,95,26,37,68,79,1,61,32].randomElement()!
        tapOnLable.text = "\(ans)"
        arr.shuffle()
        collectionView.reloadData()
    }
    
    func progress() {
        time.invalidate()
        var randomTime : Float = 1.0
        self.progressBar.progress = randomTime
        time = Timer.scheduledTimer(withTimeInterval: freq, repeats: true, block: { (_) in
            randomTime -= 0.015
            self.progressBar.progress = randomTime
            if self.progressBar.progress == 0.0  {
                self.showalert(message:"score = \(self.score)", title:"Oops time is up!!")
                self.time.invalidate()
            }
        })
    }
    
    func plushScore() {
        score = score + 1
        pointLable.text = "\(score)"
        progress()
    }
    
    func showalert(message:String,title:String) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Try again !", style: .default, handler: { _ in
            self.imageView1.image = UIImage(systemName: "heart.fill")
            self.imageView2.image = UIImage(systemName: "heart.fill")
            self.imageView3.image = UIImage(systemName: "heart.fill")
            self.time.invalidate()
            self.progress()
            
        }))
        alert.addAction(UIAlertAction.init(title: "Mods !", style: .destructive, handler: { _ in
            self.time.invalidate()
            self.navigationForMod()
            
        }))
        present(alert, animated:true, completion: nil)
    }
    
    func navigationForMod() {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "Cattegary") as! Cattegary
        navigationController?.pushViewController(navigation, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        cell.numberLable.text = "\(arr[indexPath.row])"
        cell.layer.cornerRadius = 20
        cell.layer.masksToBounds = true
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if ans != arr[indexPath.item] {
            null = null + 1
            print(null)
            
            if null == 1 {
                print("Hello")
                imageView1.image = UIImage(systemName: "heart")
            }
            else if null == 2 {
                imageView2.image = UIImage(systemName: "heart")
            }
            else if null == 3 {
                imageView3.image = UIImage(systemName: "heart")
                showalert(message: "Score\(pointLable.text)", title: "Wrong choice")
            }
            
            return
        }
        null = 0
        imageView1.image = UIImage(systemName: "heart.fill")
        imageView2.image = UIImage(systemName: "heart.fill")
        imageView3.image = UIImage(systemName: "heart.fill")
        setData()
        plushScore()
        progress()
        
    }
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 90)
    }
}
