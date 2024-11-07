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
    @IBOutlet weak var lblTimer: UILabel!
    
    // MARK: - Members

    var phoneNumber = ""
    var timer: Timer?
    var totalTime = 60
    
    // MARK: - Initializers
    
    //MARK: - Methods
    
    private func setInitials() {
        lblPhoneNumber.font = .customFont(type: .Inter_Regular, size: 18)
        lblEnterOTP.font = .customFont(type: .Inter_Bold, size: 18)
        tfOTP.font = .customFont(type: .Inter_SemiBold, size: 18)
        btnContinue.titleLabel?.font = .customFont(type: .Inter_SemiBold, size: 16)
        lblPhoneNumber.text = phoneNumber
        
        btnContinue.isUserInteractionEnabled = true
        
        tfOTP.delegate = self
    }
    
    func validate() -> Bool {
     
        if tfOTP.text!.trimmingCharacters(in: .whitespaces).count != 4 {
               GlobelFunctions.showAlert(title: "", withMessage: "Please enter a valid 4-digit OTP")
               return false
           }
        else if tfOTP.text!.trimmingCharacters(in: .whitespaces) != "1234" {
               GlobelFunctions.showAlert(title: "", withMessage: "Please re-enter a valid OTP")
               return false
           }
        
        return true
    }
    
    private func startOtpTimer() {
        self.totalTime = 60
        self.lblTimer.text = self.timeFormatted(self.totalTime)
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    @objc func updateTimer() {
        print(self.totalTime)
        self.lblTimer.text = self.timeFormatted(self.totalTime) // will show timer
        
        if totalTime != 0 {
            totalTime -= 1 // decrease counter timer
        }
        else {
            if let timer = self.timer {
                timer.invalidate()
                self.timer = nil
                self.btnContinue.isUserInteractionEnabled = false
                GlobelFunctions.showAlert(title: "", withMessage: "Please try again")
            }
        }
    }

    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

// MARK: - View lifecycle
extension AOTPVC {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.startOtpTimer()
        }
        self.setInitials()
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
        let vc = UIStoryboard.getAPhoneNumberVC()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func btnContinueDidClicked(_ sender: UIButton) {
        if(self.validate()){
            self.phoneNumberApi()
        }
    }
}

//MARK: - Network Call
extension AOTPVC {
    
    func phoneNumberApi() {
        
        ShowHUD()
        
        let url = String(otp_Url)
        
        let headerParam = [String: String]()
        
        let userInfo: [String: Any] = [
            
            "number": String(phoneNumber.removeWhitespace()),
            "otp" : String(tfOTP.text!)

        ]
        
        NetworkCall(data: userInfo, headers: headerParam, url: url, service: nil, method: .post ,isJSONRequest: false).executeQuery(){
            (result: Result<OTPDataModel,Error>) in
            switch result{
            case .success(let loginData):
                print(loginData)
                if let token = loginData.token, !token.isEmpty {
                    
                    UserDefaults.standard.setValue(loginData.token, forKey: USERD_User_Api_Totken)
                    UserDefaults.standard.synchronize()
                    
                    let vc = UIStoryboard.getHomeVC()
                    self.navigationController?.pushViewController(vc, animated: false)
                    
                } else {
                    GlobelFunctions.showAlert(title: "Error", withMessage: String(loginData.token!))
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
