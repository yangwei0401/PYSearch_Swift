//
//  ViewController.swift
//  PYSearchExample_Swift
//
//  Created by Himoo on 2019/6/13.
//  Copyright © 2019 Maxthon. All rights reserved.
//

import UIKit

class ViewController: UIViewController { //}, PYSearchViewControllerDelegate {

    @IBOutlet weak var segType: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "PYSearch Example"
    }

    @IBAction func onBtnShowClick(_ sender: Any) {
        let hotSeaches = ["Java", "Python", "Objective-C", "Swift", "C", "C++", "PHP", "C#", "Perl", "Go", "JavaScript", "R", "Ruby", "MATLAB"]
//        let searchViewController: PYSearchViewController = PYSearchViewController.init(hotSearches: hotSeaches, searchBarPlaceholder: Bundle.py_localizedString(forKey: PYSearchSearchPlaceholderText)) { [weak self] (searchViewController, searchBar, searchText) in
//            guard let strongSelf = self else { return }
//
//            let resultsViewController = strongSelf.storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
//            resultsViewController.searchText = searchText ?? ""
//            strongSelf.navigationController?.pushViewController(resultsViewController, animated: true)
//        }
//
//        searchViewController.hotSearchStyle = .colorfulTag
//        searchViewController.searchHistoryStyle = .normalTag
//        searchViewController.delegate = self
//
//        searchViewController.searchViewControllerShowMode = self.segType.selectedSegmentIndex == 0 ? .modePush : .modeModal
//        searchViewController.hidesBottomBarWhenPushed = true
//
//        if self.segType.selectedSegmentIndex == 0 {
//            self.navigationController?.pushViewController(searchViewController, animated: true)
//        } else {
//            let NavSearchViewController = UINavigationController(rootViewController: searchViewController)
//            self.present(NavSearchViewController, animated: true, completion: nil)
//        }
    }
    
//    func searchViewController(_ searchViewController: PYSearchViewController!, searchTextDidChange searchBar: UISearchBar!, searchText: String!) {
//        if searchText.count > 0 {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
//                var searchSuggestionsM = [String]()
//                for i in 0..<(1 + arc4random() % 10) {
//                    searchSuggestionsM.append(String(format: "Search suggestion %ld", i))
//                }
//                searchViewController.searchSuggestions = searchSuggestionsM
//            }
//        }
//    }
    
}

