//
//  ANoteVC.swift
//  Aisle
//
//  Created by Shivam Maurya on 06/11/24.
//

import UIKit
import Alamofire
import Kingfisher

protocol Blurable {
    func addBlur(_ alpha: CGFloat)
}

class ANoteVC: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var lblNotes: UILabel!
    @IBOutlet weak var lblPersonalMessages: UILabel!
    @IBOutlet weak var imgPersonal: UIImageView!
    @IBOutlet weak var lblInterested: UILabel!
    @IBOutlet weak var lblPremiumMember: UILabel!
    @IBOutlet weak var imgFirstPerson: UIImageView!
    @IBOutlet weak var imgSecondPerson: UIImageView!
    @IBOutlet weak var btnUpgrade: ButtonRoundCorner!
    
    // MARK: - Members

    var membershipDataClass: NotesDataModel?
    
    // MARK: - Initializers
    
    //MARK: - Methods
    
    private func setInitials() {
        lblNotes.font = .customFont(type: .Inter_Bold, size: 27)
        lblPersonalMessages.font = .customFont(type: .Inter_SemiBold, size: 18)
        lblInterested.font = .customFont(type: .Inter_Bold, size: 22)
        lblPremiumMember.font = .customFont(type: .Inter_SemiBold, size: 15)
        btnUpgrade.titleLabel?.font = .customFont(type: .Inter_Bold, size: 15)
    }
    
    private func setData() {
        
        if let invites = membershipDataClass?.invites,
           invites.profiles.count > 0,
           let profile = invites.profiles.first {
            
            // Check if there's a selected photo and use it, otherwise fallback to the first photo in the array
            let selectedPhotoURLString: String?
            
            if let selectedPhoto = profile.photos.first(where: { $0.selected == true }) {
                // If there's a selected photo, use it
                selectedPhotoURLString = selectedPhoto.photo
            } else if profile.photos.count > 0 {
                // If no selected photo, use the first photo
                selectedPhotoURLString = profile.photos[0].photo
            } else {
                // If there are no photos at all, fallback to the placeholder
                selectedPhotoURLString = nil
            }
            
            
            imgPersonal?.kf.setImage(with: URL(string: String(format: "%@",selectedPhotoURLString ?? "")), placeholder: UIImage(named: "vehicleImage"), options: nil, progressBlock: nil) { result in
                switch result {
                case .success(_):
                    // Image was successfully loaded, no action needed
                    break
                case .failure(_): break
                    // Image failed to load, set the fallback image "Vector"
                    //                self.imgView?.image = UIImage(named: "Vector")
                }
            }
        }
        
        if let canSeeProfile = membershipDataClass?.likes?.canSeeProfile {
            if canSeeProfile {
                imgFirstPerson.removeBlur()
                imgSecondPerson.removeBlur()
            } else {
                imgFirstPerson.addBlur()
                imgSecondPerson.addBlur()
            }
        }
        
        imgFirstPerson?.kf.setImage(with: URL(string: String(format: "%@",membershipDataClass!.likes?.profiles[0].avatar ?? "")), placeholder: UIImage(named: "vehicleImage"), options: nil, progressBlock: nil) { result in
            switch result {
            case .success(_):
                // Image was successfully loaded, no action needed
                break
            case .failure(_): break
                // Image failed to load, set the fallback image "Vector"
//                self.imgView?.image = UIImage(named: "Vector")
            }
        }
        
        imgSecondPerson?.kf.setImage(with: URL(string: String(format: "%@",membershipDataClass!.likes?.profiles[1].avatar ?? "")), placeholder: UIImage(named: "vehicleImage"), options: nil, progressBlock: nil) { result in
            switch result {
            case .success(_):
                // Image was successfully loaded, no action needed
                break
            case .failure(_): break
                // Image failed to load, set the fallback image "Vector"
//                self.imgView?.image = UIImage(named: "Vector")
            }
        }
        
    }
}

// MARK: - View lifecycle
extension ANoteVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        imgFirstPerson.addBlur()
        imgSecondPerson.addBlur()
        self.getNoteData()
        self.setInitials()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

   override  func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

   override  func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}

// MARK: - IBActions
extension ANoteVC {
 
    @IBAction func btnUpgradeDidClicked(_ sender: Any) {
        imgFirstPerson.removeBlur()
        imgSecondPerson.removeBlur()
    }
    
}

//MARK: - Network Call
extension ANoteVC {
   
//    func getNoteData() {
//        
//        ShowHUD()
//        
//        let url = String(notes_Url)
//        let userInfo = [String:Any]()
//        let headerParam = [String: String]()
//    
//
//        NetworkCall(data: userInfo, headers: headerParam, url: url, service: nil, method: .get ,isJSONRequest: false).executeQuery(){
//            (result: Result<NotesDataModel,Error>) in
//            switch result{
//            case .success(let loginData):
//                print(loginData.invites)
//                if(loginData.invites != nil ){
//                    
//                    self.membershipDataClass = loginData
//                    
//                }else{
//                    GlobelFunctions.showAlert(title: "", withMessage: (("error")  as NSString) as String)
//                }
//                
//                
//            case .failure(let error):
//                print(error)
//            }
//            RemoveHUD()
//        }
//    }
        
    func getNoteData() {
        ShowHUD()
        let path = String(notes_Url)
        
        // Make the GET request without a request body
        let request = AF.request(path, method: .get, headers: APIManager.headers())
        
        request.responseDecodable(of: NotesDataModel?.self) { response in
            debugPrint(response)
            
            switch response.result {
            case .success(let data):
                if let userData = data {
//                    print("User Data:", userData)
                    print(userData.invites?.profiles.count)
                    self.membershipDataClass = userData
                    self.setData()
                } else {
                    print("No user data found.")
                }
                
            case .failure(let error):
                print("Error:", error.localizedDescription)
            }
            RemoveHUD()
        }
    }

}

//MARK: - Extention {
extension ANoteVC {
    
}

extension UIView: Blurable {}
