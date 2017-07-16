//
//  ViewController.swift
//  GourmetSearch
//
//  Created by 金城裕治 on 2017/07/12.
//  Copyright © 2017年 Yuji. All rights reserved.
//

import UIKit

class ShopListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - UITableViewDelegate
    
    // セルの高さを返すメソッド.固定値で100ポイントを返している
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
    // MARK: - UITableViewDataSource
    // セクションに含まれる鉄数を返すメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20
    }
    
    
    // 表示するセルそのものを返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShopListItem") as! ShopListTableViewCell
            cell.name.text = "\(indexPath.row)"
            return cell
        }
        
        return UITableViewCell()
    }
    


}

