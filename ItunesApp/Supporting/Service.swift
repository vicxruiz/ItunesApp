//
//  Service.swift
//  ItunesApp
//
//  Created by Victor  on 6/30/19.
//  Copyright © 2019 Victor . All rights reserved.
//

import Foundation
import UIKit

class Service {
    static let itunesBaseColor = UIColor.black
    static let designGrayColor = UIColor.gray
    static let buttonCornerRadius: CGFloat = 7
    static func showAlert(on: UIViewController, style: UIAlertController.Style, title: String?, message: String?, actions: [UIAlertAction] = [ UIAlertAction(title: "OK", style: .default, handler: nil)], completion: (() -> Swift.Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        for action in actions {
            alert.addAction(action)
        }
        on.present(alert, animated: true, completion: completion)
    }
}
