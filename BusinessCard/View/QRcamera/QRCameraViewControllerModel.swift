//
//  File.swift
//  BusinessCard
//
//  Created by 奥田竜矢 on 2019/10/20.
//  Copyright © 2019 okuda ryuya. All rights reserved.
//
import UIKit
import SwiftyJSON

final class QRCameraViewControllerModel: UIViewController{
    
    private var model = QRCameraViewController()
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
        //ここの処理を聞くこと
        guard let userToken = UserData.token else { return }
        model.createUser(token: userToken) { result in
            if result {
                print("hogepiyo")
            } else {
                print("pyopiyo")
            }
        }
}
}


    
     

