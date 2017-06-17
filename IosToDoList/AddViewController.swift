//
//  AddViewController.swift
//  IosToDoList
//
//  Created by 金城裕治 on 2017/06/17.
//  Copyright © 2017年 Yuji. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    var array = [String]()
    
    @IBOutlet weak var textField: UITextField!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func add(_ sender: UIButton) {
        
        
        // アプリ内にあるならarrayに追加
        if UserDefaults.standard.object(forKey: "array") != nil {
            array = UserDefaults.standard.object(forKey: "array") as! [String]
        }
        
        
        array.append(textField.text!)
        
        // arrayをアプリ内に保存
        UserDefaults.standard.set(array, forKey: "array")
        self.navigationController?.popViewController(animated: true)
        
        
        
    }

}
