//
//  ConerImageView.swift
//  Aisle
//
//  Created by Shivam Maurya on 07/11/24.
//


class ConerImageView: UIImageView {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        
    }
    //This method does the necessary UI adjustments
    func setup()
    {
        if #available(iOS 13.0, *) {
           
         self.layer.cornerRadius = 8
            self.layer.masksToBounds = true
//            self.layer.masksToBounds = false
          


          
            
                 }
        
        
    }
}