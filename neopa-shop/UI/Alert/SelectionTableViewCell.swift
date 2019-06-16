//
//  SelectionTableViewCell.swift
//  TAKAQ_iOS
//
//  Created by satsuki_shimada on 2017/10/13.
//  Copyright © 2017年 satsuki_shimada. All rights reserved.
//

import UIKit

/// 選択式アラートの選択テーブルのセル
class SelectionTableViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // ここでセットしないと初期表示やスクロール時に色がデフォルトに戻ってしまう
        setColor(isSelected)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        setColor(selected)
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        
        if !isSelected {
            setColor(highlighted)
        }
    }
    
    private func setColor(_ isActive: Bool) {
        if isActive {
            setActiveColor()
        }
        else {
            setInactiveColor()
        }
    }
    
    private func setActiveColor() {
        label.textColor = UIColor.white
        backgroundColor = UIColor.accentColor
    }
    
    private func setInactiveColor() {
        label.textColor = UIColor.commonTextColor
        backgroundColor = UIColor.clear
    }
}
