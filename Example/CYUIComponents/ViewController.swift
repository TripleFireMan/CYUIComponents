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
        view.addSubview(v)
        v.backgroundColor = .red
        v.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(15)
            make.top.equalTo(15)
            make.height.equalTo(200)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

