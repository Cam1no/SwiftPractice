//
//  ListTableViewController.swift
//  SwiftDummyPocket
//
//  Created by 金城裕治 on 2017/06/20.
//  Copyright © 2017年 Yuji. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    
    //webviewの表示されたタイトル
    var titleArray = [String]()
    
    // webciewに表示されたURL
    var urlArray = [String]()
    
    
    
    var label1:UILabel = UILabel()
    var label2:UILabel = UILabel()
    
    var webview:UIWebView = UIWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //webviewのサイズを決定する
        webview.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        
        // urlの読み込み
        let requestURL = URL(string: "https://google.com")
        let req = NSURLRequest(url: requestURL!)
        webview.loadRequest(req as URLRequest)
        
        // webviewを表示する
        self.view.addSubview(webview)
        
        // はじめは非表示にする
        webview.isHidden = true

    }
    
    
    @IBAction func add(_ sender: Any) {
        
        //webviewを表示する
        webview.isHidden = false
        
        
        // title urlでアプリ内に保存されていたらarrayにいれる
        if UserDefaults.standard.object(forKey: "titleArray") != nil {
            titleArray = UserDefaults.standard.object(forKey: "titleArray") as! [String]
        }
        
        if UserDefaults.standard.object(forKey: "urlArray") != nil {
            urlArray = UserDefaults.standard.object(forKey: "urlArray") as! [String]
        }
        
        //webviewに表示されたタイトル, urlを格納する
        titleArray.append(webview.stringByEvaluatingJavaScript(from: "document.title")!)
        urlArray.append(webview.stringByEvaluatingJavaScript(from: "document.url")!)
        
        
        // 配列をアプリ内に保存する
        UserDefaults.standard.set(titleArray, forKey: "titleArray")
        UserDefaults.standard.set(urlArray, forKey: "urlArray")
    }
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
