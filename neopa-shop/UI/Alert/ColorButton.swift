//
//  ColorButton.swift
//  TAKAQ_iOS
//
//  Created by satsuki_shimada on 2017/10/05.
//  Copyright © 2017年 satsuki_shimada. All rights reserved.
//

import UIKit

/// 通常の背景、ハイライトの背景、無効状態のカラーを設定できるUIButton
class ColorButton: UIButton {
    @IBInspectable var normalColor: UIColor?
    @IBInspectable var highlightColor: UIColor?
    @IBInspectable var disableColor: UIColor?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setButtonColor()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setButtonColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setButtonColor()
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                self.backgroundColor = highlightColor
            }
            else {
                setButtonColor()
            }
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            setButtonColor()
        }
    }
    
    private func setButtonColor() {
        if isEnabled {
            self.backgroundColor = normalColor
        }
        else {
            self.backgroundColor = disableColor
        }
    }
}
