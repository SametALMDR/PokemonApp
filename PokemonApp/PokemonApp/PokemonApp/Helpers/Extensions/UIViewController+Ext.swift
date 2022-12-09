//
//  UIViewController+Ext.swift
//  PokemonApp
//
//  Created by Samet Alemdaroğlu on 7.12.2022.
//

import UIKit

extension UIViewController {

    static func initFromNib() -> Self {
        func initFromNib<T: UIViewController>() -> T {
            T(nibName: String(describing: self), bundle: nil)
        }
        return initFromNib()
    }
}
