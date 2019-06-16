//
//  SingleButtonAlertViewController.swift
//  TAKAQ_iOS
//
//  Created by satsuki_shimada on 2017/10/12.
//  Copyright © 2017年 satsuki_shimada. All rights reserved.
//

import UIKit

protocol AlertButtonDelegate: class {
    func alertOnPressButton(_ alertTag: Int)
}

/// 1つのボタンがあるアラート
class SingleButtonAlertViewController: UIViewController {
    @IBOutlet weak var alertWindow: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var button: ColorButton!
    weak var delegate: AlertButtonDelegate? = nil
    
    var alertTag: Int = 0
    var isError: Bool = false
    
    var alertTitle: String!
    var alertDescription: String!
    var buttonText: String!
    
    /// 指定イニシャライザ
    /// - parameters:
    ///   - title: アラートタイトル
    ///   - description: アラート本文
    ///   - buttonText: ボタン文字列
    ///   - nibName: XIBファイル名、基本的に SingleButtonAlertViewController を指定
    ///   - bundle: 基本的に nil
    init(title: String?, description: String?, buttonText: String?,
         nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        alertTitle = title
        alertDescription = description
        self.buttonText = buttonText
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titleLabel.text = alertTitle
        descriptionLabel.text = alertDescription
        button.setTitle(buttonText, for: UIControl.State.normal)
        
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
    
    @IBAction func pressButon(_ sender: UIButton) {
        dismiss(animated: true) {
            self.delegate?.alertOnPressButton(self.alertTag)
        }
    }
}
