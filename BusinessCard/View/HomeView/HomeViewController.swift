//
//  ViewController.swift
//  BusinessCard
//
//  Created by 奥田竜矢 on 2019/10/14.
//  Copyright © 2019 okuda ryuya. All rights reserved.
//

import UIKit
import SwiftyJSON

class HomeViewController: UIViewController {
    static func make() -> HomeViewController {
        return HomeViewController()
    }
    
    @IBOutlet weak var nickname: UILabel!
    @IBOutlet weak var skills: UILabel!
    @IBOutlet weak var affiliattion1: UILabel!
    @IBOutlet weak var affiliattion2: UILabel! {
        didSet {
            affiliattion2.text = ""
        }
    }
    
    @IBOutlet weak var QR: UIImageView!
    @IBOutlet weak var Git: UILabel!
    @IBOutlet weak var Qita: UILabel! {
        didSet {
            Qita.text = ""
        }
    }
    @IBOutlet weak var other: UILabel!
    @IBOutlet weak var userName: UILabel!
    
    
    private var json: JSON?
    
    func configure(result: JSON) {
        json = result
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let json = json {
            if let token = json["token"].string {
                print(token, "token")
                UserData.token = token
                print(UserData.token,"UserData.token")
                
            }
            if let nickname = json["nickname"].string {
                print(nickname, "nickname")
                self.nickname.text = nickname
            }
            
            if let Github = json["Github"].string {
                print(Github, "Github")
                self.Git.text = Github
            }
            
            if let otherURL = json["otherURL"].string {
                print(otherURL, "otherURL")
                self.other.text = otherURL
            }
            
            if let Qiita = json["Qiita"].string {
                print(Qiita, "Qiita")
                self.Qita.text = Qiita
            }
            
            if let affiliation2 = json["affiliation2"].string {
                print(affiliation2, "affiliation2")
                self.affiliattion1.text = affiliation2
            }
            
            if let skills = json["skills"].string {
                print(skills, "skills")
                self.skills.text = skills
            }
            
            if let user_id = json["user_id"].int {
                print(user_id, "user_id")
                UserData.ID = user_id
                print(UserData.ID,"UserData.ID")
            }
            
            if let affiliation1 = json["affiliation1"].string {
                print(affiliation1, "affiliation1")
                self.affiliattion1.text = affiliation1
            }
            
            if let name = json["name"].string {
                print(name, "name")
                self.userName.text = name
            }
            
        }
        
        QRcreat()
    }
    
    func QRcreat() {
        
        guard let userID = UserData.ID else{ return }
        
        //\(userID.description)変数展開という概念　文字列中に
        let url = "feb54174.ngrok.io/friendships/create/\(userID)"
        let data = url.data(using: String.Encoding.utf8)!
        
        // QRコード生成
        let urlQR = CIFilter(name: "CIQRCodeGenerator", parameters: ["inputMessage": data, "inputCorrectionLevel": "M"])!
        let sizeTransform = CGAffineTransform(scaleX: 10, y: 10)
        let qrImage = urlQR.outputImage!.transformed(by: sizeTransform)
        let context = CIContext()
        let cgImage = context.createCGImage(qrImage, from: qrImage.extent)
        let uiImage = UIImage(cgImage: cgImage!)
        
        
        
        QR.image = uiImage
        
        // 作成したQRコードを表示
//        let qrImageView = UIImageView()
//        qrImageView.contentMode = .scaleAspectFit
//        qrImageView.frame = self.view.frame
//        qrImageView.image = uiImage
//        self.view.addSubview(qrImageView)
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }
    
    //    NOTE:ここをpushで遷移させるほうがいいのかもしれない
    @IBAction func QRcameraButton(_ sender: Any) {
        let qrcameraViewController = QRCameraViewController.make()
        qrcameraViewController.modalPresentationStyle = .fullScreen
        present(qrcameraViewController, animated: false)
    }
    
    @IBAction func tableViewButton(_ sender: Any) {
        let tableView = tableViewController.make()
        tableView.modalPresentationStyle = .fullScreen
        present(tableView, animated: false)
    }
    
}


