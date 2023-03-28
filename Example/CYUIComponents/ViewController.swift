//
//  ViewController.swift
//  CYUIComponents
//
//  Created by 2731180 on 03/24/2023.
//  Copyright (c) 2023 2731180. All rights reserved.
//

import UIKit
import CYUIComponents
import SnapKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let v = CYUploadImageView.init(frame: .zero)
        v.uploadImgBlock = {(_ img: UIImage ,_ block:((_ str: NSString)->Void)?) in
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: {
                block?("12333333")
            })
        }
        view.addSubview(v)
        v.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(15)
            make.center.equalToSuperview()
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

