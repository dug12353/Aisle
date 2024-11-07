//
//  AHomeVC.swift
//  Aisle
//
//  Created by Shivam Maurya on 07/11/24.
//

import UIKit

class AHomeVC: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var viewContaner: UIView!
    @IBOutlet weak var imgDiscover: UILabel!
    @IBOutlet weak var btnDiscover: UIButton!
    @IBOutlet weak var imgNotes: UIImageView!
    @IBOutlet weak var btnNotes: UIButton!
    @IBOutlet weak var imgMatches: UIImageView!
    @IBOutlet weak var btnMatches: UIButton!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var btnProfile: UIButton!
    
    @IBOutlet weak var lblDiscover: UILabel!
    @IBOutlet weak var lblNotes: UILabel!
    @IBOutlet weak var lblMatches: UILabel!
    @IBOutlet weak var lblProfile: UIImageView!
    
    // MARK: - Members

    // MARK: - Initializers
    
    private lazy var homeVC: AHomeVC = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "AHomeVC") as! AHomeVC
        
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private lazy var notesVC: ANoteVC = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "ANoteVC") as! ANoteVC
        
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    //MARK: - Methods
    
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChild(viewController)
        
        // Add Child View as Subview
        viewContaner.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = viewContaner.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParent: self)
        
        
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParent: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParent()
    }
    
}

// MARK: - View lifecycle
extension AHomeVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        add(asChildViewController: notesVC)
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
extension AHomeVC {
 
    @IBAction func tabButtonsDidClicked(_ sender: UIButton) {
        
        if (sender.tag == 1){
            
            GlobelFunctions.showAlert(title: "", withMessage: "Features are coming soon")
            
        } else if (sender.tag == 2) {
            
            add(asChildViewController: notesVC)
            
        } else if (sender.tag == 3) {
            GlobelFunctions.showAlert(title: "", withMessage: "Features are coming soon")
        } else if sender.tag == 4 {
            GlobelFunctions.showAlert(title: "", withMessage: "Features are coming soon")
        }
        
    }
    
}

//MARK: - Network Call
extension AHomeVC {
    
}

//MARK: - Extention {
extension AHomeVC {
    
}
