//
//  UILabel+Extension.swift
//  MasterConverge
//
//  Created by MiTu on 2020/7/23.
//  Copyright © 2020 刘金丰. All rights reserved.
//

import Foundation

extension UILabel {
    convenience init(_ text: String? = .none, font: UIFont = MCFontPF(14, .Medium), color: UIColor = .black,  alignment: NSTextAlignment = .left, numberOfLines: Int = 1, backColor: UIColor = .clear, tag: Int = 0, isClick: Bool = false) {
        self.init()
        self.tag = tag
        if text != nil { self.text = text }
        self.font = font
        self.textColor = color
        self.textAlignment = alignment
        self.numberOfLines = numberOfLines
        self.backgroundColor = backColor
        self.isUserInteractionEnabled = isClick
    }
}
