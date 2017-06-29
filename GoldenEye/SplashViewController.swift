//
//  SplashViewController.swift
//  GoldenEye
//
//  Created by Application support on 25/05/17.
//  Copyright © 2017 Sandip Jadhav. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var imgLogo: UIImageView!
    
    
    var progress : Float = 0.0
    var timer = Timer()

    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
 self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.targetMethod), userInfo: nil, repeats: true)
        

    }
    func targetMethod() {
        print(progress)
        progress = progress + 0.1
        print(progress)
        if progress >= 1.0 {
            timer.invalidate()
            pushLoginView()
        }
        else {
            progressView.progress = progress
        }
    }
    
    func pushLoginView()
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "loginViewController") as! loginViewController
        
        self.navigationController?.pushViewController(nextViewController, animated:true)
        
    }
}

