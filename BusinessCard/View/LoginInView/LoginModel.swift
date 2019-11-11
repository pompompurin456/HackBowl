    //
    //  LoginModel.swift
    //  BusinessCard
    //
    //  Created by 奥田竜矢 on 2019/10/16.
    //  Copyright © 2019 okuda ryuya. All rights reserved.
    //
    
    import Foundation
    import Alamofire
    
    class RootViewModel {
        
        func loginRepository(email: String, password: String, callback: @escaping (User) -> Void) {
            
            let url = URL(string: "http://feb54174.ngrok.io/api_sessions/login")!
            
            let params:[String: Any] = [
                "email": email,
                "password": password
            ]
            
            AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default)
                .validate(statusCode: 200..<300)
                .responseJSON { response in
                    
                    switch response.result {
                    case .success(let response):
                        guard let data = response.data else { return }
                        print(data,"data")
                        guard let userToken = try? JSONDecoder().decode(User.self, from: data) else { return }
                        print(userToken, "foodList")
                        callback(userToken)
                    case .failure(let error):
                        print(error, "error")
                    }
            }
        }
    }
