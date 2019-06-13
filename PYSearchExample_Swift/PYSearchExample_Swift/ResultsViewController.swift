//
//  ResultsViewController.swift
//  PYSearchExample_Swift
//
//  Created by Himoo on 2019/6/13.
//  Copyright © 2019 Maxthon. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var edtSearchText: UILabel!
    var searchText = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.edtSearchText.text = self.searchText
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
