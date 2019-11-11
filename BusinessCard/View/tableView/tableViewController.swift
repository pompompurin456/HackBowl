//
//  tableViewController.swift
//  BusinessCard
//
//  Created by 奥田竜矢 on 2019/10/14.
//  Copyright © 2019 okuda ryuya. All rights reserved.
//

import UIKit

final class tableViewController: UIViewController {
     static func make() -> tableViewController {
           return tableViewController()
       }
    
    //名称が分かりにくいかも
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
    }
    
}

extension tableViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        return cell
    }
    
    
}
