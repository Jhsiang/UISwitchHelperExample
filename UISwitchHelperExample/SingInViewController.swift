//
//  SingInViewController.swift
//  UISwitchHelperExample
//
//  Created by Jim Chuang on 2019/4/24.
//  Copyright © 2019 nhr. All rights reserved.
//

import UIKit

class SingInViewController: UIViewController {

    var rightBtn:UIBarButtonItem = UIBarButtonItem()
    var leftBtn:UIBarButtonItem = UIBarButtonItem()

    override func viewDidLoad() {
        super.viewDidLoad()

        rightBtn = UIBarButtonItem(title: "登入", style: .done, target: self, action: #selector(gotoMain))
        self.navigationItem.rightBarButtonItem = rightBtn

        leftBtn = UIBarButtonItem(title: "秀wait", style: .done, target: self, action: #selector(showWait))
        self.navigationItem.leftBarButtonItem = leftBtn
    }

    @objc func gotoMain(){
        UISwitchHelper.shared.switchToMain()
    }

    @objc func showWait(){
        UISwitchHelper.shared.showWaitVC(title: "等3秒", contTime: 3)
    }

}
