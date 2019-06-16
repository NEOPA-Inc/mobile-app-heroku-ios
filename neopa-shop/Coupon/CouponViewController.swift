//
//  CouponViewController.swift
//  neopa-shop
//
//  Created by 武藤優哉 on 2019/06/13.
//

import UIKit

class CouponViewController: BaseViewController {
    @IBOutlet private weak var noCouponImage: UIImageView!
    @IBOutlet private weak var noCouponTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTitle(title: "クーポン")
        
        // TODO: クーポンが存在するかの判定
        noCouponImage.isHidden = true
        noCouponTextLabel.isHidden = true
    }
}

extension CouponViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20 // セルの上部のスペース
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.clear // 透明にすることでセル間のスペースとする
    }
}

extension CouponViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "couponCell", for: indexPath) as! CouponTableViewCell
        cell.configure(couponId: "XXXXXX",
                       discountNumberText: "5",
                       discountUnitText: "% OFF",
                       notesTextList: ["お買い上げ金額が税抜き5,000円以上の際に、1度限りご利用いただけます。",
                                       "店舗ではご利用いただけません。",
                                       "他クーポンとの併用はできません。",
                                       "他の方への譲渡、現金への換金はできません。"],
                       expireDateTimeText: "2019/04/30 25:59 まで")
        cell.delegate = self
        return cell
    }
}

extension CouponViewController: CouponUseButtonDelegate {
    func couponUse(couponId: String) {
        // TODO: クーポンボタンを使うときの処理
        print("Couopn \(couponId) Used")
    }
}
