

import UIKit
import CYLTabBarController

class CYLPlusButtonSubclass: CYLPlusButton,CYLPlusButtonSubclassing {

    
    static func plusButton() -> Any! {
        let button = CYLPlusButtonSubclass()
        button.setImage(UIImage(named: "TBhome"), for: .normal)
        
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        
        button.setTitle("", for: .normal)
        button.setTitleColor(UIColor.gray, for: .normal)
        
        button.setTitle("", for: .selected)
        button.setTitleColor(UIColor.blue, for: .selected)
        
        button.adjustsImageWhenHighlighted = false
        button.sizeToFit()
//        button.addTarget(self, action: #selector(testClick(sender:)), for: .touchUpInside)
        return button
    }
    
//    @objc static func testClick(sender: UIButton){
//        print("testClick")
//    }
    
    static func indexOfPlusButtonInTabBar() -> UInt {
        return 2
    }
    
    static func multiplier(ofTabBarHeight tabBarHeight: CGFloat) -> CGFloat {
        return 0.5
    }
   
    static func constantOfPlusButtonCenterYOffset(forTabBarHeight tabBarHeight: CGFloat) -> CGFloat {
        return -13
    }
    
    static func plusChildViewController() -> UIViewController! {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let dashboardvc = storyBoard.instantiateViewController(withIdentifier: "dashboardVC") as! dashboardVC
        let nav = UINavigationController(rootViewController: dashboardvc)
        return nav
        
    }
    
    
    static func shouldSelectPlusChildViewController() -> Bool {
        return true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // tabbar UI layout setup
        let imageViewEdgeWidth:CGFloat  = self.bounds.size.width * 0.9
        let imageViewEdgeHeight:CGFloat = imageViewEdgeWidth * 0.95
        
        let centerOfView    = self.bounds.size.width * 0.5
        let labelLineHeight = self.titleLabel!.font.lineHeight
        let verticalMargin = (self.bounds.size.height - labelLineHeight - imageViewEdgeHeight ) * 0.5
        
        let centerOfImageView = verticalMargin + imageViewEdgeHeight * 0.5
        let centerOfTitleLabel = imageViewEdgeHeight + verticalMargin * 2  + labelLineHeight * 0.5 + 15
        
        //imageView position layout
        self.imageView!.bounds = CGRect(x:0, y:0, width:imageViewEdgeWidth, height:imageViewEdgeHeight)
        self.imageView!.center = CGPoint(x:centerOfView, y:centerOfImageView)
//        self.imageView?.backgroundColor = .blue
        
        //title position layout
        self.titleLabel!.bounds = CGRect(x:0, y:0, width:self.bounds.size.width,height:labelLineHeight)
        self.titleLabel!.center = CGPoint(x:centerOfView, y:centerOfTitleLabel)
        
    }
    

}
