//
//  UISwitchHelper.swift
//  ParkingSetting
//
//  Created by Jim Chuang on 2019/4/24.
//  Copyright © 2019 nhr. All rights reserved.
//

import Foundation
import UIKit

let StoryBoard_ID_Main = "storyboard_id_main"
let StoryBoard_ID_SingIn = "storyboard_id_singin"
let StoryBoard_ID_Alert = "storyboard_id_alert"
let StoryBoard_ID_Wait = "storyboard_id_wait"

class UISwitchHelper{
    static let shared = UISwitchHelper()
    private var waitViewController:WaitVC?

    func switchToSingIn(){
        let sb = UIStoryboard(name: "SignIn", bundle: nil)
        let logoVC = sb.instantiateViewController(withIdentifier: StoryBoard_ID_SingIn)
        let nav = UINavigationController(rootViewController: logoVC)
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.window?.rootViewController = nav
        appDelegate?.window?.makeKeyAndVisible()
    }

    func switchToMain(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let setupVC = sb.instantiateViewController(withIdentifier: StoryBoard_ID_Main)
        let nav = UINavigationController(rootViewController: setupVC)
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.window?.rootViewController = nav
        appDelegate?.window?.makeKeyAndVisible()
    }

    func showAlert(title:String,msg:String,btnText:String, tColor:UIColor = UIColor.white,mColor:UIColor = UIColor.white,bColor:UIColor = UIColor.white){
        let sb = UIStoryboard(name: "Alert", bundle: nil)
        let alertVC = sb.instantiateViewController(withIdentifier: StoryBoard_ID_Alert) as! AlertHintVC
        alertVC.setTitle(title: title, description: msg, btnTitle: btnText,titleColor: tColor, descColor: mColor, btnColor: bColor)

        alertVC.modalPresentationStyle = .overFullScreen

        if var top = UIApplication.shared.keyWindow?.rootViewController{
            while let present = top.presentedViewController{
                top = present
            }
            top.present(alertVC, animated: false, completion: nil)
        }

    }

    func showWaitVC(title:String, contTime:Float, color:UIColor = UIColor.white){
        if waitViewController?.view.superview == nil{
            let sb = UIStoryboard(name: "Alert", bundle: nil)
            waitViewController = sb.instantiateViewController(withIdentifier: StoryBoard_ID_Wait) as? WaitVC
            waitViewController?.setTitle(title: title,color: color)
            waitViewController?.setTime(t: contTime)
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            if let view = waitViewController?.view{
                appDelegate?.window?.addSubview(view)
            }
        }else{
            waitViewController?.dismissVC()
            let sb = UIStoryboard(name: "Alert", bundle: nil)
            waitViewController = sb.instantiateViewController(withIdentifier: StoryBoard_ID_Wait) as? WaitVC
            waitViewController?.setTitle(title: title, color:color)
            waitViewController?.setTime(t: contTime)
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            if let view = waitViewController?.view{
                appDelegate?.window?.addSubview(view)
            }
        }
    }

    func dismissWaitVC(rightNow:Bool){
        if rightNow{
            waitViewController?.dismissVC()
        }else{
            waitViewController?.progDone()
        }
    }

}
