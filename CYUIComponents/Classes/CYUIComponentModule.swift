//
//  KCUIComponentModule.swift
//  KCUIComponents
//
//  Created by cheng yan on 2022/8/30.
//

import Foundation
import UIKit
class CYUIComponentModule : NSObject{
    /// 根据podName找到bundle
    static func ext_SwiftBundle(podName:String) -> Bundle? {
        let bundlePath:String? = ext_SwiftBundlePath(podName:podName)
        return Bundle(path: bundlePath ?? "")
    }
    /// 根据podName找到bundlePath
    static func ext_SwiftBundlePath(podName:String) -> String? {
        var bundlePath: String?
        for bundle: Bundle in Bundle.allBundles {
            bundlePath = bundle.path(forResource: podName, ofType: "bundle")
            if bundlePath != nil && bundlePath?.count != 0 {
                return bundlePath
            }
        }
        
        for bundle: Bundle in Bundle.allFrameworks {
            bundlePath = bundle.path(forResource: podName, ofType: "bundle") ?? ""
            if bundlePath != nil && bundlePath?.count != 0 {
                return bundlePath
            }
        }
        return bundlePath
    }
}
public
extension UIView {
    static func loadFromXib()->Self?{
        let name = NSStringFromClass(self).split(separator: ".").last
        guard let n = name else{
            return nil
        }
        let view = CYBundle.loadNibNamed(String(n), owner: nil)?.first
        return view as? Self
    }
}
