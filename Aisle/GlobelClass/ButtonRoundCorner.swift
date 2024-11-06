//
//  FCBaseButton.swift
//  Aisle
//
//  Created by Shivam Maurya on 06/11/24.
//


import UIKit

class FCBaseButton: UIButton {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    var indexPath : IndexPath?
    var section : Int?
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }
    
    //This method does the necessary UI adjustments
    func setup()
    {
        
        
        if(Device.IS_IPHONE){
            // device is iPhone
            if Orientation.isPortrait {
              //  self.font = self.font.withSize((SCREEN_WIDTH/375.0) * self.font.pointSize)
                self.titleLabel?.font = self.titleLabel?.font.withSize((SCREEN_WIDTH/375.0) * (self.titleLabel?.font.pointSize)!)
                    }
        }else if(Device.IS_IPAD){
            
    
            
            if Orientation.isPortrait {
              //  self.font = self.font.withSize((SCREEN_WIDTH/375.0) * self.font.pointSize)
                self.titleLabel?.font = self.titleLabel?.font.withSize((SCREEN_WIDTH/375.0) * (self.titleLabel?.font.pointSize)!)
            }else if Orientation.isLandscape{
                self.titleLabel?.font = self.titleLabel?.font.withSize((SCREEN_HEIGHT/375.0) * (self.titleLabel?.font.pointSize)!)
            }

        }
    }
}

class ButtonRoundCorner: UIButton {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }
      var indexPath: IndexPath?
    
    
    func setup()
    {
        self.tintColor = UIColor.white
        self.backgroundColor = GlobelFunctions.hexStringToUIColor(hex: "#B20000")
        
        if(Device.IS_IPHONE){
            // device is iPhone
            if UIDevice.current.orientation.isPortrait {
                if UIDevice.current.orientation.isPortrait {
                    //  self.font = self.font.withSize((SCREEN_WIDTH/375.0) * self.font.pointSize)
                    self.titleLabel?.font = self.titleLabel?.font.withSize((SCREEN_WIDTH/375.0) * (self.titleLabel?.font.pointSize)!)
                }
                    }
        }else if(Device.IS_IPAD){
            
            if Orientation.isPortrait {
              //  self.font = self.font.withSize((SCREEN_WIDTH/375.0) * self.font.pointSize)
                self.titleLabel?.font = self.titleLabel?.font.withSize((SCREEN_WIDTH/375.0) * (self.titleLabel?.font.pointSize)!)
            }else if Orientation.isLandscape{
                self.titleLabel?.font = self.titleLabel?.font.withSize((SCREEN_HEIGHT/375.0) * (self.titleLabel?.font.pointSize)!)
            }
            
        }
        
        
        self.layer.cornerRadius = 4
        layer.masksToBounds = true
    }
    
    func disable(){
        self.alpha = 0.5
        self.isEnabled = false
    }
    
    func enabled(){
        self.alpha = 1
        self.isEnabled = true
    }
    
}






