//
//  UIColor+Ext.swift
//  PokemonApp
//
//  Created by Samet Alemdaroğlu on 9.12.2022.
//

import UIKit

extension UIColor {

    static var defaultColor: UIColor {
        .black
    }

    static var primary: UIColor {
        UIColor(named: "primary") ?? defaultColor
    }
}
