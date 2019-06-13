//
//
//  GitHub: https://github.com/iphone5solo/PYSearch
//  Created by CoderKo1o.
//  Copyright © 2016 iphone5solo. All rights reserved.
//
//
//  PYSearchConst_Swift.swift
//  PYSearchExample_Swift
//
//  Created by Himoo on 2019/6/13.
//  Copyright © 2019 Maxthon. All rights reserved.
//

import UIKit

let PYSEARCH_MARGIN = 10
let PYSEARCH_BACKGROUND_COLOR = PYSEARCH_COLOR(255, 255, 255)

func PYSEARCH_LOG<T>(_ object: @autoclosure () -> T, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
    #if DEBUG
    let value = object()
    let fileURL = NSURL(fileURLWithPath: file).lastPathComponent ?? "Unknown file"
    let queue = Thread.isMainThread ? "UI" : "BG"
    
    print("<\(queue)> \(fileURL) \(function)[\(line)]: " + String(reflecting: value))
    #endif
}

func PYSEARCH_COLOR(_ r: Double, _ g: Double, _ b: Double) -> UIColor {
    return UIColor(red: CGFloat(r/255.0), green: CGFloat(g/255.0), blue: CGFloat(b/255.0), alpha: 1.0)
}

let PYSEARCH_RANDOM_COLOR = PYSEARCH_COLOR(Double(arc4random_uniform(256)), Double(arc4random_uniform(256)), Double(arc4random_uniform(256)))

let PYSEARCH_REALY_SCREEN_WIDTH = UIScreen.main.bounds.size.width
let PYSEARCH_REALY_SCREEN_HEIGHT = UIScreen.main.bounds.size.height
let PYScreenW = PYSEARCH_REALY_SCREEN_WIDTH < PYSEARCH_REALY_SCREEN_HEIGHT ? PYSEARCH_REALY_SCREEN_WIDTH : PYSEARCH_REALY_SCREEN_HEIGHT
let PYScreenH = PYSEARCH_REALY_SCREEN_WIDTH > PYSEARCH_REALY_SCREEN_HEIGHT ? PYSEARCH_REALY_SCREEN_WIDTH : PYSEARCH_REALY_SCREEN_HEIGHT
let PYSEARCH_SCREEN_SIZE = CGSize(width: CGFloat(PYScreenW), height: CGFloat(PYScreenH))

let PYSEARCH_SEARCH_HISTORY_CACHE_PATH = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last ?? "").appendingPathComponent("PYSearchhistories.plist").absoluteString



let PYSearchSearchPlaceholderText = "PYSearchSearchPlaceholderText"
let PYSearchHotSearchText = "PYSearchHotSearchText"
let PYSearchSearchHistoryText = "PYSearchSearchHistoryText"
let PYSearchEmptySearchHistoryText = "PYSearchEmptySearchHistoryText"

let PYSearchEmptyButtonText = "PYSearchEmptyButtonText"
let PYSearchEmptySearchHistoryLogText = "PYSearchEmptySearchHistoryLogText"
let PYSearchCancelButtonText = "PYSearchCancelButtonText"
let PYSearchBackButtonText = "PYSearchBackButtonText"

