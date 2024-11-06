//
//  ButtonRoundCorner.swift
//  Aisle
//
//  Created by Shivam Maurya on 06/11/24.
//


import UIKit


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
        self.tintColor = UIColor.black
//        self.backgroundColor = GlobelFunctions.hexStringToUIColor(hex: "#B20000")
        self.backgroundColor = UIColor.systemYellow
        
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
        
        
        self.layer.cornerRadius = self.frame.height / 2
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






