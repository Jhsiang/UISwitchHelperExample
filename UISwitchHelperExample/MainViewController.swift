//
//  MainViewController.swift
//  UISwitchHelperExample
//
//  Created by Jim Chuang on 2019/4/24.
//  Copyright © 2019 nhr. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var rightBtn:UIBarButtonItem = UIBarButtonItem()
    var leftBtn:UIBarButtonItem = UIBarButtonItem()

    override func viewDidLoad() {
        super.viewDidLoad()

        rightBtn = UIBarButtonItem(title: "回到singIn", style: .done, target: self, action: #selector(gotoSingIn))
        self.navigationItem.rightBarButtonItem = rightBtn

        leftBtn = UIBarButtonItem(title: "秀alert", style: .done, target: self, action: #selector(showAlert))
        self.navigationItem.leftBarButtonItem = leftBtn

    }

    @objc func gotoSingIn(){
        UISwitchHelper.shared.switchToSingIn()
    }

    @objc func showAlert(){
        UISwitchHelper.shared.showAlert(title: "Main", msg: "秀aler", btnText: "確認")
    }

}
