//
//  ViewController.swift
//  SplitIt
//
//  Created by Amrutha Krishnan on 11/21/16.
//  Copyright © 2016 Amrutha Krishnan. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

    let loginButton = FBSDKLoginButton()
        
    view.addSubview(loginButton)
    loginButton.frame = CGRect (x: 16, y: 370, width: view.frame.width - 32, height: 50)
    loginButton.readPermissions = ["email","public_profile","user_friends"]
    loginButton.delegate = self
        
        
        
        
   /*  let showFriendsButton = UIButton()
     showFriendsButton.frame = CGRect (x: 16, y: 440, width: view.frame.width - 32, height: 50)
     showFriendsButton.backgroundColor = #colorLiteral(red: 0.6525310874, green: 0.75812608, blue: 0.9692990184, alpha: 1)
     showFriendsButton.setTitle("Show Friends", for: .normal)
     view.addSubview(showFriendsButton)
     
        showFriendsButton.addTarget(self, action: #selector(showFriends), for: .touchUpInside)*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    
    
    }

  /*  func showFriends() {
        let parameters = ["fields":"name, picture.type(normal)"]
        FBSDKGraphRequest (graphPath: "/me/friends", parameters: parameters).start {(connection, result, err) in
            if err != nil {
                print(err)
                return
            }
            
            var friends = [Friend]()
            for friendDictionary in user["data"] as! NSDictionary {
                let name = friendDictionary["name"] as! String
                if let picture = friendDictionary["picture"]?["data"]?!["url"] as! String{
                    let friend = Friend(name: name, picture: picture)
                    friends.append(friend)
                }
                
            }
            
            
            
            
    }
    }*/
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did Log out of Facebook")
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        if error != nil {
            print(error)
            return
        }
        
       
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email, picture.type(large)"]).start { (connection, result, err) in
            
            if err != nil{
                print("Failed to start graph request:", err)
                return
            }
            
            print(result)
            
            self.performSegue(withIdentifier: "landingPageSegue", sender: nil)

            
        }
    }

}

