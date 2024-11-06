//
//  ANoteVC.swift
//  Aisle
//
//  Created by Shivam Maurya on 06/11/24.
//

import UIKit

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
        btnUpgrade.titleLabel?.font = .customFont(type: .Inter_SemiBold, size: 15)
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
    }
    
}

//MARK: - Network Call
extension ANoteVC {
   
    func getNoteData() {
        
        ShowHUD()
        
        let url = String(notes_Url)
        let userInfo = [String:Any]()
        let headerParam = [String: String]()
    

        NetworkCall(data: userInfo, headers: headerParam, url: url, service: nil, method: .get ,isJSONRequest: false).executeQuery(){
            (result: Result<NotesDataModel,Error>) in
            switch result{
            case .success(let loginData):
                print(loginData.invites)
                if(loginData.invites != nil ){
                    
                    self.membershipDataClass = loginData
                    
                }else{
                    GlobelFunctions.showAlert(title: "", withMessage: (("error")  as NSString) as String)
                }
                
                
            case .failure(let error):
                print(error)
            }
            RemoveHUD()
        }
    }
    
}

//MARK: - Extention {
extension ANoteVC {
    
}

extension UIView: Blurable {}
