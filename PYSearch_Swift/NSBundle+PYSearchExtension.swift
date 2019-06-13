//
//  NSBundle+PYSearchExtension.swift
//  PYSearchExample_Swift
//
//  Created by Himoo on 2019/6/13.
//  Copyright © 2019 Maxthon. All rights reserved.
//

import UIKit

extension Bundle {
    
    static var searchBundle: Bundle? = nil
    static var py_localizedStringBundle: Bundle? = nil
    
    class func py_searchBundle() -> Bundle? {
        if nil == searchBundle {
            //Default use `[NSBundle mainBundle]`.
            searchBundle = Bundle(path: Bundle.main.path(forResource: "PYSearch", ofType: "bundle") ?? "")
            /**
             If you use pod import and configure `use_frameworks` in Podfile, [NSBundle mainBundle] does not load the `PYSearch.fundle` resource file in `PYSearch.framework`.
             */
            if nil == searchBundle {
                // Empty description resource file in `PYSearch.framework`.
                searchBundle = Bundle(path: Bundle(for: PYSearchViewController.self).path(forResource: "PYSearch", ofType: "bundle") ?? "")
            }
        }
        return searchBundle
    }
    
    class func py_localizedString(forKey key: String?) -> String? {
        return self.py_localizedString(forKey: key, value: nil)
    }

    class func py_localizedString(forKey key: String?, value: String?) -> String? {
        var value = value
        if nil == py_localizedStringBundle {
            var language = NSLocale.preferredLanguages.first
            if language?.hasPrefix("en") ?? false {
                language = "en"
            } else if language?.hasPrefix("es") ?? false {
                language = "es"
            } else if language?.hasPrefix("fr") ?? false {
                language = "fr"
            } else if language?.hasPrefix("zh") ?? false {
                if (language as NSString?)?.range(of: "Hans").location != NSNotFound {
                    language = "zh-Hans"
                } else {
                    language = "zh-Hant"
                }
            } else {
                language = "en"
            }
            
            // Find resources from `PYSearch.bundle`
            py_localizedStringBundle = Bundle(path: Bundle.py_searchBundle()?.path(forResource: language, ofType: "lproj") ?? "")
            
        }
        value = py_localizedStringBundle?.localizedString(forKey: key ?? "", value: value, table: nil)
        return Bundle.main.localizedString(forKey: key ?? "", value: value, table: nil)
    }
    
    class func py_imageNamed(_ name: String?) -> UIImage? {
        var name = name
        let scale = UIScreen.main.scale
        name = 3.0 == scale ? "\(name ?? "")@3x.png" : "\(name ?? "")@2x.png"
        let image = UIImage(contentsOfFile: URL(fileURLWithPath: Bundle.py_searchBundle()?.resourcePath ?? "").appendingPathComponent(name ?? "").absoluteString)
        return image
    }

}
