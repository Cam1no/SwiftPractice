//
//  ViewController.swift
//  SwiftWunderList
//
//  Created by 金城裕治 on 2017/06/22.
//  Copyright © 2017年 Yuji. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    
    @IBOutlet weak var backImageView: UIImageView!
    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var textField: UITextField!
    
    
    
    
    // 初回ロードされた時のみ呼び出される
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //読み込み時に, tableView, textFieldをデリゲートする
        backView.layer.cornerRadius = 10.0
        table.delegate = self
        table.dataSource = self
        textField.delegate = self
        
        
        // cellの下のborderLineが不必要
        table.separatorStyle = .none
        
    }
    
    
    // textFieldのデリゲートメソッド
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // returnキーが押されるとキーボードを閉じる
        textField.resignFirstResponder()
        
        return true
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    // tableViewControllerのデリゲートメソッド. これがないとエラーになる. TableViewControllerを作ると初期状態で
    // 作られるメソッドたち.↓↓↓↓↓↓↓↓↓↓↓↓↓↓
    
    //セクション数を決める
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    
    // セルの数を決める
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    
    // セルの状態.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Configure the cell...
        
        cell.layer.cornerRadius = 10.0
        
        return cell
    }


}

