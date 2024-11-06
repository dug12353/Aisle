//
//  APhoneNumberVC.swift
//  Aisle
//
//  Created by Shivam Maurya on 06/11/24.
//

import UIKit

class APhoneNumberVC: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var lblOTP: UILabel!
    @IBOutlet weak var lblEnterNumber: UILabel!
    @IBOutlet weak var btnContinue: ButtonRoundCorner!
    @IBOutlet weak var tfCountryNumber: UITextField!
    @IBOutlet weak var tfPhoneNumber: UITextField!
    
    // MARK: - Members

    // MARK: - Initializers
    
    //MARK: - Methods
    
    private func initialSetup() {
        lblOTP.font = .customFont(type: .Inter_Regular, size: 18)
        lblEnterNumber.font = .customFont(type: .Inter_Bold, size: 30)
        btnContinue.titleLabel?.font = .customFont(type: .Inter_SemiBold, size: 16)
        tfCountryNumber.font = .customFont(type: .Inter_SemiBold, size: 18)
        tfPhoneNumber.font = .customFont(type: .Inter_SemiBold, size: 18)
        
        tfCountryNumber.delegate = self
        tfPhoneNumber.delegate = self
    }
}

// MARK: - View lifecycle
extension APhoneNumberVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialSetup()
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
extension APhoneNumberVC {
 
    
}

//MARK: - Network Call
extension APhoneNumberVC {
    
}

//MARK: - Extention {
extension APhoneNumberVC : UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = textField.text ?? ""
        let nsString = text as NSString
        let newText = nsString.replacingCharacters(in: range, with: string)
        
        // Set maximum length based on the text field's tag
        let maxLength = (textField.tag == 3) ? 3 : (textField.tag == 10) ? 10 : Int.max
        
        return newText.count <= maxLength
    }


}