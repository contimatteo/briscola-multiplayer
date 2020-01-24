//
//  SocialsController.swift
//  Briscola-Multiplayer
//
//  Created by Matteo Conti on 06/01/2020.
//  Copyright © 2020 Matteo Conti. All rights reserved.
//

import Foundation
import UIKit
import FBSDKLoginKit


class SocialsController: UIViewController {
    
    //
    // MARK:
    
    var facebookManager: FacebookManager?;
    
    @IBOutlet weak var FBCustomLoginButton: UIButton!
    
    //
    // MARK:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.facebookManager = FacebookManager(permissions: ["public_profile", "user_friends"]);
    }
    
    @IBAction func performFBLogin(_ sender: Any) {
        facebookManager!.login(from: self, didCompleteHandler: self.loginDidComplete);
    }
    
    @IBAction private func performFBLogout() {
        facebookManager!.logout();
        print("[INFO] FB logout done!");
    }
    
    func loginDidComplete(_ result: LoginManagerLoginResult?, errors: Error?) {
        if errors != nil {
            // Process error
            print("[INFO] FB Login failed with error \(errors!)");
            
            return;
        }
        
        guard let loginResult = result else {
            print("[INFO] FB Login: something went wrong.");
            return;
        }
        
        // LOGIN EXECUTED
            
        print("[INFO] FB login result \(result!)");
        
        // IS CANCELED ?
        if (loginResult.isCancelled) {
            print("[INFO] FB User cancelled login.");
            return
        }
        
        // LOGIN COMPLETED SUCCESSFULLY
        // If you ask for multiple permissions at once, you
        // should check if specific permissions missing
        if loginResult.grantedPermissions.contains("email")
        {
            // Do work
        }
    }
    
}
