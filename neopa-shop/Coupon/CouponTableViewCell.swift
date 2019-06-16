//
//  CouponTableViewCell.swift
//  neopa-shop
//
//  Created by 武藤優哉 on 2019/06/14.
//

import UIKit

protocol CouponUseButtonDelegate {
    func couponUse(couponId: String)
}

class CouponTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var discountNumberLabel: UILabel!
    @IBOutlet private weak var discountUnitLabel: UILabel!
    @IBOutlet private weak var notesLabel: UILabel!
    @IBOutlet private weak var expireLabel: UILabel!
    
    @IBAction func useCouponButton(_ sender: Any) {
        self.delegate?.couponUse(couponId: self.couponId)
    }
    
    var delegate: CouponUseButtonDelegate?
    private var couponId: String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(couponId: String, discountNumberText: String, discountUnitText: String, notesTextList: [String], expireDateTimeText: String) {
        self.couponId = couponId
        discountNumberLabel.text = discountNumberText
        discountUnitLabel.text = discountUnitText
        notesLabel.attributedText = add(stringList: notesTextList, font: notesLabel.font)
        expireLabel.text = expireDateTimeText
    }
    
    
    // 箇条書きLabelのattributedTextを設定する
    func add(stringList: [String],
             font: UIFont,
             bullet: String = "\u{2022}",
             indentation: CGFloat = 10,
             lineSpacing: CGFloat = 4) -> NSAttributedString {
        
        let textAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font]
        let bulletAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font]
        
        let paragraphStyle = NSMutableParagraphStyle()
        let nonOptions = [NSTextTab.OptionKey: Any]()
        paragraphStyle.tabStops = [
            NSTextTab(textAlignment: .left, location: indentation, options: nonOptions)]
        paragraphStyle.defaultTabInterval = indentation
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.headIndent = indentation
        
        let bulletList = NSMutableAttributedString()
        for string in stringList {
            let formattedString = "\(bullet)\t\(string)\n"
            let attributedString = NSMutableAttributedString(string: formattedString)
            
            attributedString.addAttributes(
                [NSAttributedString.Key.paragraphStyle : paragraphStyle],
                range: NSMakeRange(0, attributedString.length))
            
            attributedString.addAttributes(
                textAttributes,
                range: NSMakeRange(0, attributedString.length))
            
            let string:NSString = NSString(string: formattedString)
            let rangeForBullet:NSRange = string.range(of: bullet)
            attributedString.addAttributes(bulletAttributes, range: rangeForBullet)
            bulletList.append(attributedString)
        }
        
        return bulletList
    }
}
