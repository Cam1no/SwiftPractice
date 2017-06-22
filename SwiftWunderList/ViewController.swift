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
    
    var titleArray = [String]()
    
    var label:UILabel = UILabel()
    
    var count:Int = 0
    
    
    
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
    
    // 画面が表示される都度呼び出される
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // アプリに保存されているToDoを取得する
        if UserDefaults.standard.object(forKey: "titleArray") != nil {
            titleArray = UserDefaults.standard.object(forKey: "titleArray") as! [String]
        }
        
        //tableViewをreloadする
        
        table.reloadData()
    }
    
    
    // textFieldのデリゲートメソッド
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
        // titleArrayに文字列を保存する
        titleArray.insert(textField.text!, at: 0)
        UserDefaults.standard.set(titleArray, forKey: "titleArray")
        
        if UserDefaults.standard.object(forKey: "titleArray") != nil {
            titleArray = UserDefaults.standard.object(forKey: "titleArray") as! [String]
        
            // returnキーが押されるとキーボードを閉じる
            textField.resignFirstResponder()
            
            textField.text = ""
            
            // tableViewをreloadする
            table.reloadData()
        
        }
        
        return true
    
    }
    
    // cellが選択されたあと　画面遷移で使うのはこれ！
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        count = Int(indexPath.row)
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next" {
            let nextViewController:NextViewController = segue.destination as! NextViewController
            
            nextViewController.selectedNumber  = count
            nextViewController.titleText = titleArray[count]
        }
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    // tableViewControllerのデリゲートメソッド. これがないとエラーになる. TableViewControllerを作ると初期状態で
    // 作られるメソッドたち.↓↓↓↓↓↓↓↓↓↓↓↓↓↓
    
    //セクション数を決める
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    // セルの数を決める
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return titleArray.count
    }
    
    
    // セルの状態.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.layer.cornerRadius = 10.0
    
        label = cell.contentView.viewWithTag(1) as! UILabel
        
        label.text = titleArray[indexPath.row]
        
        return cell
    }
    
    
    // セルの削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            titleArray.remove(at: indexPath.row)
            UserDefaults.standard.set(titleArray, forKey: "titleArray")
            
            table.reloadData()
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }


}

