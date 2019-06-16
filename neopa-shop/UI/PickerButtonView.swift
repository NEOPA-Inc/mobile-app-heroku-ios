//
//  PickerButtonView.swift
//  TAKAQ_iOS
//
//  Created by 武藤優哉 on 2019/02/09.
//  Copyright © 2019年 satsuki_shimada. All rights reserved.
//

import UIKit
protocol PickerButtonViewDelegate: class {
    func didTap(tag: Int)
}

class PickerButtonView: UIView {
    @IBOutlet weak var label: UILabel!
    weak var delegate: PickerButtonViewDelegate? = nil
    
    @IBAction func buttuonTapped(_ sender: Any) {
        delegate?.didTap(tag: self.tag)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }
    
    func configure(label: String?) {
        self.label.text = label
    }
    
    /// 選択済かどうか
    func isSelected(defaultText: String? = nil) -> Bool {
        var isValid = false
        if let text = self.label.text,
            !text.isEmpty,
            text != defaultText {
            isValid = true
        }
        return isValid
    }
    
    func loadNib() {
        if let view = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView {
            view.frame = self.bounds
            self.addSubview(view)
        }
    }
}
