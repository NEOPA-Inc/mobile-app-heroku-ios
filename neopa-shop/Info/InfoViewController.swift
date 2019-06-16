//
//  InfoViewController.swift
//  neopa-shop
//
//  Created by 武藤優哉 on 2019/06/13.
//

import UIKit

class InfoViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTitle(title: "会員情報編集")
        
        // TODO: テキストフィールドに入力開始したら自動でスクロール調整
        // TODO: テキストフィールドでEnterキーを押したら次のテキストフィールドにカーソル移動
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 画面をタップしたらキーボードをしまう
        self.view.endEditing(true)
    }
}

class CustomScrollView: UIScrollView {
    // スクロールゔビューでタッチイベントを取得する
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        superview?.touchesBegan(touches, with: event)
    }
}
