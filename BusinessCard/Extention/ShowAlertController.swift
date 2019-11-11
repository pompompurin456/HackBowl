//
//  ShowAlertController.swift
//  BusinessCard
//
//  Created by 奥田竜矢 on 2019/10/16.
//  Copyright © 2019 okuda ryuya. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlertController (
        title: String? = nil,
        message: String? = nil,
        actionttitle: String = "OK",
        withCancle: Bool = false,
        cancleTitle: String = "Cancle",
        hander: ((UIAlertAction) -> ())? = nil) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: actionttitle, style: .default, handler: hander))
        
        if withCancle {
            alertController.addAction(UIAlertAction(title: cancleTitle, style: .cancel))
            present(alertController,animated: true)
        }
}
}
