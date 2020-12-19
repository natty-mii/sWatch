//
//  ViewController.swift
//  sWatch
//
//  Created by Naoya Miyamoto on 2020/09/02.
//  Copyright © 2020 Naoya Miyamoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var aButton: UIButton!
    
    @IBOutlet weak var bButton: UIButton!
    
    var count = 10
    var count1 = 0
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ラベルの文字をとりあえず０と表示させたい反映させたい
        countLabel.text = "0"
        //タイマーの文字をとりあえず10と表示させたい反映させたい
        timerLabel.text = "10"
        //a,bButtonの入力をfalseにしておく
        aButton.isEnabled = false
        bButton.isEnabled = false
        
    }
    
   @IBAction func start(_ sender: Any) {

       //count1計測を開始したい→a,bButtonの入力を可能にする。カウントが10もしくはENDと表示、またカウント1が0のとき）
    if (count == 10 && count1 == 0){
       aButton.isEnabled = true
       bButton.isEnabled = true
       //タイマーをカウントダウンさせたい（10秒から0秒まで）
       countDownTimer()
    }
       
       
       
   }
    
    func countDownTimer() {
        
        //タイマーを10秒からカウントダウンさせたい　タイマーを回す　1秒毎にあるメソッドを呼ぶ
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
    }
    
        //1秒毎に呼ばれるメソッド 秒数を−１する
    @objc func timerUpdate() {
        //カウントが1以上であれば、1ずつ減らす
        if count > 1 {
            count = count - 1
     timerLabel.text = String(count)
        } else if count == 1 {
            timerLabel.text = "END"
        }
    }
    
    @IBAction func reset(_ sender: Any) {

    //カウント計測を０表示,タイマーを10に戻したい
    timer.invalidate()
    count1 = 0
    countLabel.text = String(count1)
    count = 10
    timerLabel.text = String(count)
    
    //a,bButtonの入力をfalseにしておく
    aButton.isEnabled = false
    bButton.isEnabled = false
    }
    
    
    @IBAction func aButton(_ sender: Any) {
        //ラベルに文字数字を反映させたい
        countLabel.text = String(count1)
        // カウントアップさせたい
        count1 = count1 + 1
        
        //timerLabelが0秒になったらtimerを止めて、a,bButtonの入力をfalseにする
        if (timerLabel.text == "END") {
            timer.invalidate()
            aButton.isEnabled = false
            bButton.isEnabled = false
        }
    }
    
    @IBAction func bButton(_ sender: Any) {
        //ラベルに文字数字を反映させたい
        countLabel.text = String(count1)
        // カウントアップさせたい
        count1 = count1 + 1
        //timerLabelが0秒、ENDになったら、a,bButtonの入力をfalseにする
        if (timerLabel.text == "END") {
            aButton.isEnabled = false
            bButton.isEnabled = false
        }
    }
    
}
