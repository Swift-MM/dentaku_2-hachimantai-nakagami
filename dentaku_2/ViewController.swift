//
//  ViewController.swift
//  dentaku_2
//
//  Created by NAKAGAMI on 2016/11/08.
//  Copyright © 2016年 NAKAGAMI. All rights reserved.
//

import UIKit


//enum operatorKey: String {
//    case plus = "+"
//    case mainas = "-"
//    case times = "*"
//    case devide = "/"
//  

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    //displayという関数を定義し、ラベルを関連付けた
    var typing  = false
    var previousValue: Double = 0.0
    var currentOperator: String?
    //こいつらはグローバル関数なので、下の幾つかの関数の中でも何度か使われている。
    
    @IBAction func numButton(_ sender: UIButton) {
        
        //UIButtonは青で、Anyだとピンクで表示される。（ミッドナイト）同じ型の表現なのになぜ？
        //ちなみにその時、currentTitleはUIButtonだと青で、Anyだと白で表されていた。
        if let digit = sender.currentTitle {
            //digitという定数を定義し、カレントタイトルプロパティに送っている
            if typing {
                let currentDisplay = display.text! + digit
                //text!とtextが謎
                display.text = currentDisplay
            } else {
                display.text = digit}
        }
        typing = true
    }
    
    @IBAction func calculation(_ sender: UIButton) {
        //四則計算のボタンと紐付いてる
        currentOperator = sender.currentTitle!
        previousValue = Double(display.text!)!
        typing = false
    }
    
    @IBAction func equal(_ sender: UIButton) {
        
        
//        if currentOperator == "+" {
//            previousValue += Double(display.text!)!
//        } else if currentOperator == "-"{
//            
//            previousValue -= Double(display.text!)!
//        } else if currentOperator == "×"{
//            
//            previousValue *= Double(display.text!)!
//        } else if currentOperator == "÷"{
//            
//            previousValue /= Double(display.text!)!
//        }
//        
        
        
        switch currentOperator! {
            
        case "+":
            previousValue += Double(display.text!)!
            break
            
        case "-":
            previousValue -= Double(display.text!)!
            break
            
        case "*":
            previousValue *= Double(display.text!)!
            break
            
        case "/":
            previousValue /= Double(display.text!)!
            break
            
        default:
            break
        }
        
        
        display.text = String(previousValue)
        previousValue = 0.0
        typing = false
        currentOperator = nil
    }
}
