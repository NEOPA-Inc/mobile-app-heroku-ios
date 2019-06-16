//
//  MemberCardViewController.swift
//  neopa-shop
//
//  Created by 武藤優哉 on 2019/06/13.
//

import UIKit

class MemberCardViewController: BaseViewController {

    @IBOutlet weak var barcodeImage: UIImageView!
    @IBOutlet weak var barCodeNumberLabel: CustomLabel!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTitle(title: "会員証")
        // TODO: 会員情報の設定
        barCodeNumberLabel.text = "1234567891011"
        pointLabel.text = "1000"
        statusLabel.text = "モバイル会員"
    }
}
