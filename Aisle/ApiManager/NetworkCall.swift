//
//  NetworkCall.swift
//  Aisle
//
//  Created by Shivam Maurya on 06/11/24.
//

import Foundation
import Alamofire
import SwiftyDrop

class APIManager {
    class func headers() -> HTTPHeaders {
        var headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        
        // Check if the token is present in UserDefaults
        if GlobelFunctions.isKeyPresentInUserDefaults(key: USERD_User_Api_Totken) {
            // Retrieve and add the Authorization token to headers
            if let token = UserDefaults.standard.value(forKey: USERD_User_Api_Totken) as? String {
                headers["Authorization"] = "Bearer \(token)"
                print(headers)
            }
            
            if let token = UserDefaults.standard.string(forKey: USERD_User_Api_Totken) {
                       headers["Authorization"] = "Bearer \(token)"
                       print("Authorization Header: \(headers["Authorization"] ?? "")")
                   } else {
                       print("Token not found in UserDefaults")
                   }
        }
        
        return headers
    }
}

class NetworkCall : NSObject{
    
    enum services :String{
        case posts = "posts"
    }
    
    enum VendingMachineError: Error {
        case NOinterNet
        
    }
    
    var parameters = Parameters()
    var headers = HTTPHeaders()
    var method: HTTPMethod!
    var url :String! = "https://jsonplaceholder.typicode.com/"
    var encoding: ParameterEncoding! = JSONEncoding.default
    
    var imageData : Data?
    var ImageName : String?
    
    var  imageDataArry : [Data]?
    var  imageNameArray : [String]?
    
    init(data: [String:Any],headers: [String:String] = [:],url :String?,service :services? = nil, method: HTTPMethod = .post, isJSONRequest: Bool = true,imageData :Data? = Data(),imageNameKey :String? = nil,imageArray:[Data]? = nil,imageNameArray:[String]? = nil){
        super.init()
        data.forEach{parameters.updateValue($0.value, forKey: $0.key)}
        
        var headerParam = [String: String]()
        
        
                if GlobelFunctions.isKeyPresentInUserDefaults(key: USERD_User_Api_Totken) {
                    headerParam["Authorization"] = String(format: "Bearer %@", UserDefaults.standard.value(forKey: USERD_User_Api_Totken) as? String ?? "")
                    print(headerParam)
                }
        
                headerParam["x-api-key"] = "f4fd127ec8f0406e"
        
        headerParam["Authorization"] = "U29ueUluZGlh:QVBJVmFsdWU="
        headerParam.forEach({self.headers.add(name: $0.key, value: $0.value)})
        if url == nil, service != nil{
            self.url += service!.rawValue
        }else{
            self.url = url
        }
        if !isJSONRequest{
            encoding = URLEncoding.default
        }
        
        if (imageData != nil){
            self.imageData = imageData
        }
        
        self.ImageName = imageNameKey
        
        self.method = method
        
        if(imageArray?.count ?? 0 > 0){
            self.imageNameArray = imageNameArray
            self.imageDataArry = imageArray
            
            print(imageDataArry)
        }
        print("Service: \(service?.rawValue ?? self.url ?? "") \n data: \(parameters)")
    }
    
    func executeQuery<T>(completion: @escaping (Result<T, Error>) -> Void) where T: Codable {
        if(GlobelFunctions.isConnectedToInternet()){
            
            AF.request(url,method: method,parameters: parameters,encoding: encoding, headers: headers){ $0.timeoutInterval = 60 }
                .responseData(completionHandler: {response in
                    switch response.result{
                    case .success(let res):
                        if let code = response.response?.statusCode{
                            //                        switch code {
                            //                        case 200...299:
                            do {
                                completion(.success(try JSONDecoder().decode(T.self, from: res)))
                                print(String(data: res, encoding: .utf8) ?? "nothing received")
                                print(res)
                                
                            } catch let error {
                                print(String(data: res, encoding: .utf8) ?? "nothing received")
                                completion(.failure(error))
                            }
                            //                     3
                        }
                    case .failure(let error):
                        completion(.failure(error))
                    }
                })
        }else{
            DispatchQueue.main.async {
                Drop.down(NoInternetMsg, state:.color( UIColor.red))
            }
            
            completion(.failure(VendingMachineError.NOinterNet))
        }
    }
}
