//
//  SelectionListViewController.swift
//  TAKAQ_iOS
//
//  Created by satsuki_shimada on 2017/10/13.
//  Copyright © 2017年 satsuki_shimada. All rights reserved.
//

import UIKit

protocol SelectionListDelegate: class {
    func didSelectAtIndex(_ index: Int, tag: Int?)
    func didCancel()
}

/// 指定された文字列のリストを選択させる選択式のアラート
class SelectionListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var baseWindow: UIView!
    
    weak var delegate: SelectionListDelegate? = nil
    
    var listTitle: String!
    var contentList: [String] = []
    var selectedIndex: Int = 0
    /// ChangeProfileViewControllerで使用
    var tag: Int?
    
    /// 指定イニシャライザ
    /// - parameters:
    ///   - title: アラートタイトル
    ///   - contents: 選択肢の文字列
    ///   - selectedIndex: 現在選択中のインデックス
    init(title: String?, contents: [String], selectedIndex: Int) {
        super.init(nibName: "SelectionListViewController", bundle: nil)
        
        listTitle = title
        contentList = contents
        self.selectedIndex = selectedIndex
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titleLabel.text = listTitle
        
        baseWindow.layer.shadowOffset = CGSize(width: 0, height: 5)
        baseWindow.layer.shadowOpacity = 0.25
        
        // テーブル初期化
        tableView.register(UINib.init(nibName: "SelectionTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "select")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 選択しているところまでスクロール
        if selectedIndex >= 0 &&
            selectedIndex < contentList.count {
            let selectedIndexPath: IndexPath = IndexPath(row: selectedIndex, section: 0)
            tableView.selectRow(at: selectedIndexPath, animated: false, scrollPosition: .middle)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressCloseButton() {
        dismiss(animated: true) {
            self.delegate?.didCancel()
        }
    }
    
    // MARK: tableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "select", for: indexPath)
        if let cell = cell as? SelectionTableViewCell {
            cell.label.text = contentList[indexPath.row]
            cell.isSelected = indexPath.row == selectedIndex
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true) {
            self.delegate?.didSelectAtIndex(indexPath.row, tag: self.tag)
        }
    }
}
