//
//  SelectableAlertViewController.swift
//  TAKAQ_iOS
//
//  Created by satsuki_shimada on 2017/10/11.
//  Copyright © 2017年 satsuki_shimada. All rights reserved.
//

import UIKit

protocol SelectableAlertDelegate: class {
    func alertOnPressLeftButton(_ alertTag: Int)
    func alertOnPressRightButton(_ alertTag: Int)
}

/// 2つのボタンがあるアラート
class SelectableAlertViewController: UIViewController {
    @IBOutlet weak var alertWindow: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var leftButton: ColorButton!
    @IBOutlet weak var rightButton: ColorButton!
    weak var delegate: SelectableAlertDelegate? = nil
    
    var alertTag: Int = 0
    var isError: Bool = false
    
    var alertTitle: String!
    var alertDescription: String!
    var leftButtonText: String!
    var rightButtonText: String!

    /// 指定イニシャライザ
    /// - parameters:
    ///   - title: アラートタイトル
    ///   - description: アラート本文
    ///   - leftButtonText: 左ボタン文字列
    ///   - rightButtonText: 右ボタン文字列
    ///   - nibName: XIBファイル名、基本的に SelectableAlertViewController を指定
    ///   - bundle: 基本的に nil
    init(title: String?, description: String?, leftButtonText: String?, rightButtonText: String?,
         nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        alertTitle = title
        alertDescription = description
        
        self.leftButtonText = leftButtonText
        self.rightButtonText = rightButtonText
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titleLabel.text = alertTitle
        descriptionLabel.text = alertDescription
        
        leftButton.setTitle(leftButtonText, for: UIControl.State.normal)
        rightButton.setTitle(rightButtonText, for: UIControl.State.normal)
        // レイアウトを考慮して設定変更
        leftButton.titleLabel?.numberOfLines = 0
        rightButton.titleLabel?.numberOfLines = 0
        leftButton.titleLabel?.textAlignment = .center
        rightButton.titleLabel?.textAlignment = .center
        
        alertWindow.layer.shadowOffset = CGSize(width: 0, height: 5)
        alertWindow.layer.shadowOpacity = 0.25
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if isError {
            // タイトルを赤字に変更
            titleLabel.textColor = UIColor.red
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressLeftButton(_ sender: UIButton) {
        dismiss(animated: true) {
            self.delegate?.alertOnPressLeftButton(self.alertTag)
        }
    }
    
    @IBAction func pressRightButton(_ sender: UIButton) {
        dismiss(animated: true) {
            self.delegate?.alertOnPressRightButton(self.alertTag)
        }
    }
}
