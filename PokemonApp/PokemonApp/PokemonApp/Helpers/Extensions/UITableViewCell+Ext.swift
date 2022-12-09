//
//  UITableViewCell+Ext.swift
//  PokemonApp
//
//  Created by Samet Alemdaroğlu on 8.12.2022.
//

import UIKit

extension UITableViewCell {

    static func register(to tableView: UITableView) {
        let className = String(describing: self)
        let nib = UINib(nibName: className, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: className)
    }
}
