//
//  Color.swift
//  MasterConverge
//
//  Created by MiTu on 2020/6/17.
//  Copyright © 2020 刘金丰. All rights reserved.
//

import Foundation
import UIKit

func HexColor(_ hex: String, _ a: CGFloat = 1) -> UIColor {
    return UIColor(hex: hex, a)
}

/// 主题色
let ThemeColor = HexColor("#41A986")

/// 导航条返回按钮颜色
let BackBarColor = HexColor("#444444")

/// 分割线颜色
let SeparateColor = HexColor("#E0E0E0")

/// 黄昏色
let DuskColor = HexColor("#494B59")

let TagColor  = HexColor("#F85F48")

/// 282828 色
let _28_color = HexColor("#282828")
let _33_color = HexColor("#333333")
let _66_color = HexColor("#666666")
let _99_color = HexColor("#999999")
let _7c_color = HexColor("#7C7C7C")
let _7d_color = HexColor("#7D7D7D")
let _7e_color = HexColor("#7E7E7E")
let _a4_color = HexColor("#A4A4A4")
let _a5_color = HexColor("#A5A5A5")
let _aa_color = HexColor("#AAAAAA")
let _ae_color = HexColor("#AEAEAE")
let _cd_color = HexColor("#CDCDCD")
let _dc_color = HexColor("#DCDCDC")
let _df_color = HexColor("#DFDFDF")
let _e4_color = HexColor("#E4E4E4")
let _e5_color = HexColor("#E5E5E5")
let _ee_color = HexColor("#EEEEEE")
let _ef_color = HexColor("#EFEFEF")
let _f0_color = HexColor("#F0F0F0")
let _f5_color = HexColor("#F5F5F5")
let _f6_color = HexColor("#F6F6F6")
let _f7_color = HexColor("#F7F7F7")
let _f8_color = HexColor("#F8F8F8")
let _f9_color = HexColor("#F9F9F9")
let _bb_color = HexColor("#BBBBBB")

/// 金木水火土 五元素颜色
let _fiveElements_color: [UIColor] = [HexColor("#F4CC93"),
                                      HexColor("#87D37D"),
                                      HexColor("#A7D4EE"),
                                      HexColor("#FF8D8D"),
                                      HexColor("#A19377")]
