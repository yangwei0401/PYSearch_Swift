//
//  PYSearchSuggestionViewController.swift
//  PYSearchExample_Swift
//
//  Created by Himoo on 2019/6/13.
//  Copyright © 2019 Maxthon. All rights reserved.
//

import UIKit

typealias PYSearchSuggestionDidSelectCellBlock = (UITableViewCell?) -> Void

protocol PYSearchSuggestionViewDataSource: NSObject, UITableViewDataSource {
    
    func searchSuggestionView(_ searchSuggestionView: UITableView?, cellForRowAt indexPath: IndexPath?) -> UITableViewCell?
    func searchSuggestionView(_ searchSuggestionView: UITableView?, numberOfRowsInSection section: Int) -> Int
}

extension PYSearchSuggestionViewDataSource {
    
    func numberOfSections(searchSuggestionView: UITableView?) -> Int{}
    func searchSuggestionView(_ searchSuggestionView: UITableView?, heightForRowAtIndexPath: IndexPath?) -> CGFloat{}
}

class PYSearchSuggestionViewController: UITableViewController {
    
    weak var dataSource: PYSearchSuggestionViewDataSource?
    var searchSuggestions: [String] = []
    var didSelectCellBlock: PYSearchSuggestionDidSelectCellBlock?
    
    var originalContentInsetWhenKeyboardShow: UIEdgeInsets!
    var originalContentInsetWhenKeyboardHidden: UIEdgeInsets!
    var keyboardDidShow = false

    
    class func searchSuggestionViewController(with didSelectCellBlock: @escaping PYSearchSuggestionDidSelectCellBlock) -> PYSearchSuggestionViewController {
        let searchSuggestionVC = self.init()
        searchSuggestionVC.didSelectCellBlock = didSelectCellBlock
        searchSuggestionVC.automaticallyAdjustsScrollViewInsets = false
        return searchSuggestionVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        if #available(iOS 9.0, *) {
            tableView.cellLayoutMarginsFollowReadableWidth = false
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboradFrameDidShow(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboradFrameDidHidden(notification:)), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.keyboardDidShow {
            self.originalContentInsetWhenKeyboardShow = self.tableView.contentInset
        } else {
            self.originalContentInsetWhenKeyboardHidden = self.tableView.contentInset
        }
    }
    
    @objc func keyboradFrameDidShow(notification: NSNotification)  {
        self.keyboardDidShow = true
        self.setSearchSuggestions(self.searchSuggestions)
    }
    
    @objc func keyboradFrameDidHidden(notification: NSNotification) {
        self.keyboardDidShow = false
        self.originalContentInsetWhenKeyboardHidden = UIEdgeInsets(top: -30, left: 0, bottom: 30, right: 0)
        self.setSearchSuggestions(self.searchSuggestions)
    }
    
    //MARK: -setter
    func setSearchSuggestions(_ searchSuggestions: [String]?) {
        self.searchSuggestions = searchSuggestions ?? [String]()
        
        tableView.reloadData()
        
        if keyboardDidShow && (originalContentInsetWhenKeyboardShow != UIEdgeInsets.zero) && (originalContentInsetWhenKeyboardShow != UIEdgeInsets(top: -30, left: 0, bottom: 30 - (navigationController?.navigationBar.frame.maxY ?? 0), right: 0)) {
            tableView.contentInset = originalContentInsetWhenKeyboardShow
        } else if !keyboardDidShow && originalContentInsetWhenKeyboardHidden != UIEdgeInsets.zero && originalContentInsetWhenKeyboardHidden != UIEdgeInsets(top: -30, left: 0, bottom: 30 - (navigationController?.navigationBar.frame.maxY ?? 0), right: 0) {
            tableView.contentInset = originalContentInsetWhenKeyboardHidden
        }
        tableView.contentOffset = CGPoint(x: 0, y: -tableView.contentInset.top)
        
        if Float(UIDevice.current.systemVersion) ?? 0.0 >= 11.0 {
            // iOS 11
            tableView.contentInset = UIEdgeInsets(top: -30, left: 0, bottom: 0, right: 0)
        }
    }
    
    //MARK: -Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataSource?.numberOfSections(searchSuggestionView: tableView) ?? 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource?.searchSuggestionView(tableView, numberOfRowsInSection: section) ?? self.searchSuggestions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: UITableViewCell = self.dataSource?.searchSuggestionView(tableView, cellForRowAt: indexPath) {
            return cell
        }
        let cellID = "PYSearchSuggestionCellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
            cell?.textLabel?.textColor = .darkGray
            cell?.textLabel?.font = UIFont.systemFont(ofSize: 14)
            cell?.backgroundColor = .clear
            let line = UIImageView(image: Bundle.py_imageNamed("cell-content-line"))
            line.py_height = 0.5
            line.alpha = 0.7
            line.py_x = PYSEARCH_MARGIN
            line.py_y = 43
            line.py_width = PYScreenW
            cell?.contentView.addSubview(line)
        }
        cell?.imageView?.image = Bundle.py_imageNamed("search")
        cell?.textLabel?.text = self.searchSuggestions[indexPath.row]
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.dataSource?.searchSuggestionView(tableView, heightForRowAtIndexPath: indexPath) ?? 44
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (self.didSelectCellBlock != nil) {
            didSelectCellBlock!(tableView.cellForRow(at: indexPath))
        }
    }
}
