//
//  MenuViewController.swift
//  MyBenifits
//
//  Created by Application support on 24/05/17.
//  Copyright © 2017 Semantech. All rights reserved.
//

import UIKit

protocol SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex(_ index : Int32)
}

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var imgforUser: UIImageView!
  
    @IBOutlet var tblMenuOptions : UITableView!
    
    @IBOutlet var btnCloseMenuOverlay : UIButton!
    
    @IBOutlet weak var lblUerName: UILabel!
    
    var arrayMenuOptions = [Dictionary<String,String>]()

    var btnMenu : UIButton!
    
    var delegate : SlideMenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblMenuOptions.tableFooterView = UIView()
     
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        drawGradientOver(container: bgView)
        //   tblMenuOptions.separatorColor = UIColor.white
        //createGradientLayer()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateArrayMenuOptions()
          // drawGradientOver(container: bgView)
        self.imgforUser.layer.borderWidth = 1.0
        self.imgforUser.layer.masksToBounds = false
        self.imgforUser.layer.borderColor = UIColor.white.cgColor
        self.imgforUser.layer.cornerRadius = self.imgforUser.frame.size.width/2
        self.imgforUser.clipsToBounds = true

    }
    
    func drawGradientOver(container: UIView) {
        
        let maskLayer = CAGradientLayer()
        maskLayer.opacity = 1.0
        maskLayer.colors = [UIColor .red.cgColor, UIColor.cyan.cgColor]
        
        // Hoizontal - commenting these two lines will make the gradient veritcal
        maskLayer.startPoint = CGPoint(x: 0.0, y: 0.3)
        maskLayer.endPoint = CGPoint(x: 1.0, y: 0.4)
        
        // let gradTopStart = NSNumber(value: 0.2)
        //  let gradTopEnd = NSNumber(value: 0.4)
        let gradBottomStart = NSNumber(value: 0.0)
        let gradBottomEnd = NSNumber(value: 0.9)
        // maskLayer.locations = [gradTopStart, gradTopEnd, gradBottomStart, gradBottomEnd]
        maskLayer.locations = [ gradBottomStart, gradBottomEnd]
        maskLayer.bounds = container.bounds
        maskLayer.anchorPoint = CGPoint.zero
        container.layer.addSublayer(maskLayer)
        
        container.bringSubview(toFront: imgforUser)
        
        container.bringSubview(toFront: lblUerName)
        
        
        
        
    }
    

    
 
        func updateArrayMenuOptions()
        {
            arrayMenuOptions.append(["title":"Refral ", "icon":MyConstant.AppIcon.SiconHome])
            arrayMenuOptions.append(["title":"Sandip ", "icon":MyConstant.AppIcon.SiconTrackClaims])
            arrayMenuOptions.append(["title":"Survay ", "icon":MyConstant.AppIcon.SiconPolicyFeature])
            arrayMenuOptions.append(["title":"setting", "icon":MyConstant.AppIcon.SiconClaimProcedure])
            arrayMenuOptions.append(["title":" Hospitals ", "icon":MyConstant.AppIcon.SiconNetworkhosital])
            arrayMenuOptions.append(["title":"Utilities", "icon": MyConstant.AppIcon.SiconUtilities])
            arrayMenuOptions.append(["title":"Contact Details ","icon":MyConstant.AppIcon.SiconContactDetails])
           
            arrayMenuOptions.append(["title":"Logout ", "icon":MyConstant.AppIcon.SiconLogout])
            
            tblMenuOptions.reloadData()
        }
    
    
    @IBAction func onCloseMenuClick(_ button:UIButton!){
        btnMenu.tag = 0
        
        if (self.delegate != nil) {
            var index = Int32(button.tag)
            if(button == self.btnCloseMenuOverlay){
                index = -1
            }
            delegate?.slideMenuItemSelectedAtIndex(index)
        }
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
            }, completion: { (finished) -> Void in
                self.view.removeFromSuperview()
                self.removeFromParentViewController()
        })
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellMenu")!
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.layoutMargins = UIEdgeInsets.zero
        cell.preservesSuperviewLayoutMargins = false
        cell.backgroundColor = UIColor.clear
        
        let lblTitle : UILabel = cell.contentView.viewWithTag(101) as! UILabel
        let imgIcon : UILabel = cell.contentView.viewWithTag(100) as! UILabel
         imgIcon.font=UIFont(name: MyConstant.AppFont.SFontelloName, size:22)
        imgIcon.textColor = UIColor.blue
        imgIcon.text =  arrayMenuOptions[indexPath.row]["icon"]!
        lblTitle.text = arrayMenuOptions[indexPath.row]["title"]!
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let btn = UIButton(type: UIButtonType.custom)
        btn.tag = indexPath.row
        self.onCloseMenuClick(btn)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMenuOptions.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
}
