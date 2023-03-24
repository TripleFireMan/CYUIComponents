//
//  CYUploadImageView.swift
//  Pods
//
//  Created by cheng yan on 2023/3/24.
//

import UIKit
import SnapKit
@objcMembers
public class CYUploadImageView: UIView {
    
    var imgviews : NSMutableArray?
    var placeHolderImg : UIImage?
    var maxCount : Int?
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        let img = UIImageView.init()
        img.image = CYImage("blue_point")
        addSubview(img)
        img.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


}
