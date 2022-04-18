//
//  ViewController.swift
//  slideshowApp
//
//  Created by 田中健斗 on 2022/04/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    //画像を格納
    let imageName = ["number_1","number_2","number_3"]
    var changeImageNo = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //画面表示時は再生ボタンの表記に
        StartStop1.setTitle("再生", for: .normal)
    }
    
    //imageViewタップ時画面遷移
    @IBAction func ImageView(_ sender: Any) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "BigViewController") as! BigViewController
        //遷移前に画像を渡す処理
        secondViewController.outputValue = ImageView.image
        if self.timer != nil {
            
        self.timer?.invalidate()
        self.timer = nil
        }
        //文字変更
        StartStop1.setTitle("再生", for: .normal)
        //その他ボタンを活性化
        Susumu1.isEnabled = true
        Modoru1.isEnabled = true
        
        //遷移
        self.present(secondViewController, animated: true, completion: nil)
                
        
        
    }
    
    //進むボタンの動き
    @IBAction func Susumu(_ sender: Any) {
        if changeImageNo == 0 {
            changeImageNo = 1
        } else if changeImageNo == 1 {
            changeImageNo = 2
        } else if changeImageNo == 2 {
            changeImageNo = 0
        }
        let name = imageName[changeImageNo]
        ImageView.image = UIImage(named: name)
        
    }
    
    //戻るボタンの動き
    @IBAction func Modoru(_ sender: Any) {
        if changeImageNo == 0 {
            changeImageNo = 2
        } else if changeImageNo == 2 {
            changeImageNo = 1
        } else if changeImageNo == 1 {
            changeImageNo = 0
        }
        let name = imageName[changeImageNo]
        ImageView.image = UIImage(named: name)
        
        
    }
    
    //ボタンを宣言
    @IBOutlet weak var Susumu1: UIButton!
    @IBOutlet weak var Modoru1: UIButton!
    @IBOutlet weak var StartStop1: UIButton!
    

    
    //タイマーセット
    var timer: Timer?
    
    //自動再生停止ボタンの動き
    @IBAction func StartStop(_ sender: Any) {
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
        
                if self.timer == nil {
                    self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(Susumu(_:)), userInfo: nil, repeats: true)
                    //文字変更
                    StartStop1.setTitle("停止", for: .normal)
                    //その他ボタンを非活性
                    Susumu1.isEnabled = false
                    Modoru1.isEnabled = false
                    
                }else{
                    self.timer?.invalidate()
                    self.timer = nil
                    //文字変更
                    StartStop1.setTitle("再生", for: .normal)
                    //その他ボタンを活性化
                    Susumu1.isEnabled = true
                    Modoru1.isEnabled = true
                }
    
        
                    


}
}

