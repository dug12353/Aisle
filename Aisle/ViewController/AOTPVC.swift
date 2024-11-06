//
//  AOTPVC.swift
//  Aisle
//
//  Created by Shivam Maurya on 06/11/24.
//

import UIKit

class AOTPVC: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var lblPhoneNumber: UILabel!
    @IBOutlet weak var lblEnterOTP: UILabel!
    @IBOutlet weak var tfOTP: UITextField!
    @IBOutlet weak var btnContinue: ButtonRoundCorner!
    
    // MARK: - Members

    var phoneNumber = ""
    
    // MARK: - Initializers
    
    //MARK: - Methods
    
    private func setInitials() {
        lblPhoneNumber.font = .customFont(type: .Inter_Regular, size: 18)
        lblEnterOTP.font = .customFont(type: .Inter_Bold, size: 18)
        tfOTP.font = .customFont(type: .Inter_SemiBold, size: 18)
        btnContinue.titleLabel?.font = .customFont(type: .Inter_SemiBold, size: 16)
        lblPhoneNumber.text = phoneNumber
        
        tfOTP.delegate = self
    }
}

// MARK: - View lifecycle
extension AOTPVC {

    override func viewDidLoad() {
        super.viewDidLoad()
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
extension AOTPVC {
 
    @IBAction func btnNumberDidClicked(_ sender: UIButton) {
        tfOTP.becomeFirstResponder()
    }
    
    @IBAction func btnContinueDidClicked(_ sender: UIButton) {
       
    }
}

//MARK: - Network Call
extension AOTPVC {
    
    func phoneNumberApi() {
        
        ShowHUD()
        
        let url = String(otp_Url)
        
        let headerParam = [String: String]()
        
        let userInfo: [String: Any] = [
            
            "number": "+919876543212",
              "otp" : "1234"

        ]
        
        NetworkCall(data: userInfo, headers: headerParam, url: url, service: nil, method: .post ,isJSONRequest: false).executeQuery(){
            (result: Result<OTPDataModel,Error>) in
            switch result{
            case .success(let loginData):
                print(loginData)
                if let token = loginData.token, !token.isEmpty {
                    
                    let vc = UIStoryboard.getAOTPVC()
                    vc.phoneNumber = "\(self.tfCountryNumber.text!) \(self.tfPhoneNumber.text!)"
                    self.navigationController?.pushViewController(vc, animated: false)
                    
                } else {
                    GlobelFunctions.showAlert(title: "Error", withMessage: String(loginData.status!))
                }
                
            case .failure(let error):
                print(error)
            }
            RemoveHUD()
        }
    }
    
}

//MARK: - Extention {
extension AOTPVC : UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let text = textField.text ?? ""
            let nsString = text as NSString
            let newText = nsString.replacingCharacters(in: range, with: string)
            return newText.count <= 4
        }
}
