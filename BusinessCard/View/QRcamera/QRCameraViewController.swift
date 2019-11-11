//
//  QR.swift
//  BusinessCard
//
//  Created by 奥田竜矢 on 2019/10/18.
//  Copyright © 2019 okuda ryuya. All rights reserved.
//

import UIKit
import AVFoundation
import SwiftyJSON
import Alamofire

final class QRCameraViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    static func make() -> QRCameraViewController {
        return QRCameraViewController()
    }
    
    //    let model = QRCameraViewControllerModel()
    //カメラ、マイクの入出力を管理できる
    let session = AVCaptureSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //カメラ、マイクのデバイスオブジェクトの作成
        let devices: [AVCaptureDevice] = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: .video, position: .back).devices
        
        //　該当するデバイスのうち最初に取得したもの(背面カメラ)を利用する
        if let backCamera = devices.first {
            do {
                let deviceInput = try AVCaptureDeviceInput(device: backCamera)
                if self.session.canAddInput(deviceInput) {
                    self.session.addInput(deviceInput)
                    
                    // 背面カメラの映像からQRコードを検出するための設定
                    let metadataOutput = AVCaptureMetadataOutput()
                    
                    if self.session.canAddOutput(metadataOutput) {
                        self.session.addOutput(metadataOutput)
                        
                        metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                        metadataOutput.metadataObjectTypes = [.qr]
                        
                        // 背面カメラの映像を画面に表示するためのレイヤーを生成
                        let previewLayer = AVCaptureVideoPreviewLayer(session: self.session)
                        previewLayer.frame = self.view.bounds
                        previewLayer.videoGravity = .resizeAspectFill
                        self.view.layer.addSublayer(previewLayer)
                        
                        // 読み取り開始
                        self.session.startRunning()
                    }
                }
            } catch {
                print("Error occured while creating video device input: \(error)")
            }
        }
    }
}

extension QRCameraViewController {
    func createUser(token: String, handler: @escaping (Bool) -> Void) {
        let params: [String: Any] = [
            
            "token": UserData.token
        ]
        
        let url = URL(string: "metadata.stringValue")!
        
        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default)
            //200~300の間で通信可能ですよ！！
            .validate(statusCode: 200..<300)
            .responseJSON{ response in
                switch response.result {
                case .success(let response):
                    let json = JSON(response)
                    print("json",json)
                    print(json["token"])
                    if let token = json["token"].string {
                        print("token", token)
//                        handler(token)
                    }
                case .failure(let error):
                    print("error",error)
                }
        }
    }
}
