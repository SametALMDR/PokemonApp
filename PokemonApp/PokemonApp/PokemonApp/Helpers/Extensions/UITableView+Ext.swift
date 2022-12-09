//
//  UITableView+Ext.swift
//  PokemonApp
//
//  Created by Samet Alemdaroğlu on 8.12.2022.
//

import UIKit

extension UITableView {

    func dequeueCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        let className = String(describing: T.self)
        guard let cell = dequeueReusableCell(withIdentifier: className, for: indexPath) as? T else {
            fatalError("Cannot dequeue cell with identifier \(className))")
        }
        return cell
    }
}
