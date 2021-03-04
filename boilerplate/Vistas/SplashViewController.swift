//
//  SplashViewController.swift
//  boilerplate
//
//  Created by user177974 on 19/10/2020.
//

import UIKit

class SplashViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool){
        
        self.performSegue(withIdentifier: "goToLogin", sender: nil)
    }
}
