//
//  NextViewController.swift
//  SwiftWunderList
//
//  Created by 金城裕治 on 2017/06/22.
//  Copyright © 2017年 Yuji. All rights reserved.
//

import UIKit

class NextViewController: UIViewController, UITextViewDelegate {
    
    //選択された時のパラメーターがわってくる変数
    var selectedNumber:Int = 0
    var titleText:String = ""
    
    @IBOutlet weak var textField: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        textField.text = titleText

    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    
    @IBAction func openMail(_ sender: UIButton) {
    
        
    }

    

}
