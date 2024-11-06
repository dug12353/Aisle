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

    // MARK: - Initializers
    
    //MARK: - Methods
    
    private func setInitials() {
        lblPhoneNumber.font = .customFont(type: .Inter_Regular, size: 18)
        lblEnterOTP.font = .customFont(type: .Inter_Bold, size: 18)
        tfOTP.font = .customFont(type: .Inter_SemiBold, size: 18)
        btnContinue.titleLabel?.font = .customFont(type: .Inter_SemiBold, size: 16)
        
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
 
    
}

//MARK: - Network Call
extension AOTPVC {
    
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
