//
//  BigViewController.swift
//  slideshowApp
//
//  Created by 田中健斗 on 2022/04/04.
//

import UIKit

class BigViewController: UIViewController {
    
    
    //拡大画像の設定
    @IBOutlet weak var bigImage: UIImageView!
    //ViewControllerから画像を取得し、格納
    var outputValue: UIImage!
    
    
    //戻るボタンの実装
    @IBAction func modoruButtun(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        //取得した画像を画面呼び出し時に表示
        bigImage.image = outputValue
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
