//
//  BaseVC.swift
//  PokemonApp
//
//  Created by Samet Alemdaroğlu on 9.12.2022.
//

import Foundation
import UIKit

class BaseVC: UIViewController {

    // MARK: - LifeCycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
}

// MARK: - Public Methods

extension BaseVC {

    func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .primary
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }

    func handleLoader(isLoading: Bool) {
        let loader = LoaderView.initFromNib()
        DispatchQueue.main.async {
            if isLoading {
                loader.modalPresentationStyle = .overFullScreen
                self.present(loader, animated: false)
            } else {
                self.dismiss(animated: false)
            }
        }
    }
}
