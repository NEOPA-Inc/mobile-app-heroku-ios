//
//  MainTabBarController.swift
//  neopa-shop
//
//  Created by 武藤優哉 on 2019/06/13.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    private var selectionIndicator: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if selectionIndicator == nil {
            // タブの高さが決まるところでカラーを指定
            setTabColor()
        }
    }
    
    func setTabColor() {
        // タブバーの背景色
        tabBar.barTintColor = UIColor.white
        // タブ選択中のアイコン画像のカラー
        tabBar.tintColor = UIColor.white
        
        // selectionIndicatorImage set
        let itemWidth: CGFloat = tabBar.bounds.width / (CGFloat)((tabBar.items?.count)!)
        
        let selectionIndicator: UIView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: itemWidth, height: tabBar.bounds.height)))
        if selectionIndicator.frame.height > 49.0 {
            // iPhoneX用
            let colorIndicator: UIView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: selectionIndicator.frame.width, height: 49.0)))
            selectionIndicator.backgroundColor = UIColor.clear
            colorIndicator.backgroundColor = UIColor.accentColor
            // 上側だけカラーになるようにする
            selectionIndicator.addSubview(colorIndicator)
        }
        else {
            selectionIndicator.backgroundColor = UIColor.accentColor
        }
        UIGraphicsBeginImageContext(selectionIndicator.bounds.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        selectionIndicator.layer.render(in: context)
        self.selectionIndicator = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        tabBar.selectionIndicatorImage = self.selectionIndicator
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

