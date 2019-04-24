//
//  AlertHintVC.swift
//  ParkingSetting
//
//  Created by Jim Chuang on 2019/4/24.
//  Copyright © 2019 nhr. All rights reserved.
//

import UIKit

class AlertHintVC: UIViewController {

    static let shared = AlertHintVC()

    private var t = ""
    private var d = ""
    private var b = ""

    private var tColor:UIColor = UIColor.white
    private var dColor:UIColor = UIColor.white
    private var bColor:UIColor = UIColor.white
    
    @IBOutlet private var alertTitleLabel: UILabel!
    @IBOutlet private var alertLineView: UIView!
    @IBOutlet private var alertDesLabel: UILabel!
    @IBOutlet private var alertEnterBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        alertTitleLabel.text = t
        alertDesLabel.text = d
        alertEnterBtn.setTitle(b, for: .normal)

        alertTitleLabel.textColor = tColor
        alertDesLabel.textColor = dColor
        alertEnterBtn.setTitleColor(bColor, for: .normal)
    }

    func setTitle(title:String,description:String,btnTitle:String, titleColor:UIColor = .white, descColor:UIColor = .white, btnColor:UIColor = .white){
        t = title
        d = description
        b = btnTitle
    }

    @IBAction private func enterBtnClick(_ sender: UIButton) {
        self.dismiss(animated: false) {
            
        }
    }
/*
 UIButton *button = sender;
 [self dismissViewControllerAnimated:NO completion:^{
 if (self.alertDelegate && [self.alertDelegate respondsToSelector:@selector(userAlert:withOption:withTitle:)])
 {
 [self.alertDelegate userAlert:self withOption:ALERT_OPTION_BUTTON1 withTitle:[button titleForState:UIControlStateNormal]];
 }
 }];
 */
}
