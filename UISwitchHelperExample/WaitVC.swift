//
//  WaitVC.swift
//  ParkingSetting
//
//  Created by Jim Chuang on 2019/4/24.
//  Copyright © 2019 nhr. All rights reserved.
//

import UIKit

class WaitVC: UIViewController {

    private var msg = ""
    private var msgColor:UIColor = UIColor.white
    private var totalTime:Float = 0
    private let triggerT:Float = 0.5

    private var myT:Timer?

    @IBOutlet var msgLabel: UILabel!
    @IBOutlet var progView: UIProgressView!

    override func viewDidLoad() {
        super.viewDidLoad()

        msgLabel.text = msg
        msgLabel.textColor = msgColor
        progView.progress = 0
        progView.progressTintColor = .blue
        progView.trackTintColor = .white
        //progView.transform = progView.transform.scaledBy(x: 1, y: 1)

        myT = Timer.scheduledTimer(withTimeInterval: Double(triggerT), repeats: true, block: { (Timer) in
            self.handleProg()
        })
    }

    func setTime(t:Float){
        totalTime = t
    }

    func setTitle(title:String,color:UIColor = UIColor.white){
        msg = title
        msgColor = color
    }

    func progDone(){
        totalTime = 0
    }

    func dismissVC(){
        myT?.invalidate()
        self.view.removeFromSuperview()
    }

    func handleProg(){
        if progView.progress >= 1 {
            myT?.invalidate()
            self.view.removeFromSuperview()
        }
        progView.progress += totalTime == 0 ? 1 : triggerT/totalTime
    }
}
