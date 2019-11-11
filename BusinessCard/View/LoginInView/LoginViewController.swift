//
//  LoginViewController.swift
//  BusinessCard
//
//  Created by 奥田竜矢 on 2019/10/14.
//  Copyright © 2019 okuda ryuya. All rights reserved.
//

import UIKit
import SafariServices
import SwiftyJSON

class LoginViewController: UIViewController {
    static func make() -> LoginViewController {
        return LoginViewController()
    }
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var mailAdress: UITextField!
    
    private var model = RootViewModel()
    //    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButton(_ sender: Any) {
        
        guard let email = mailAdress.text, let password = userName.text else { return }
        model.loginRepository(email: email, password: password, callback: { [weak self] result  in
            print(result, "result")
            //書き換えたい→どこかでコードを置き換える
            let homeViewController = HomeViewController.make()
            homeViewController.configure(result: result)
            homeViewController.modalPresentationStyle = .fullScreen
            self?.present(homeViewController, animated: false)
        })
        
    }
}

