//
//  KCUIComponentConst.swift
//  KCUIComponents
//
//  Created by cheng yan on 2022/8/30.
//

import Foundation
public let CYBundle = CYUIComponentModule.ext_SwiftBundle(podName: "CYUIComponents")!

public let cancelStr: String = "cancel"
public let confirmStr : String = "confirm"

public func CYImage(_ name : String?)-> UIImage{
    return UIImage.init(named: name ?? "", in: CYBundle, compatibleWith: nil)!
}