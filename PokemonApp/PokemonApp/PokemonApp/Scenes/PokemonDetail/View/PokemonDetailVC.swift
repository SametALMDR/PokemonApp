//
//  PokemonDetailVC.swift
//  PokemonApp
//
//  Created by Samet Alemdaroğlu on 8.12.2022.
//

import UIKit
import Kingfisher

final class PokemonDetailVC: BaseVC {

    // MARK: - IBOutlets

    @IBOutlet private weak var pokemonImageView: UIImageView!
    @IBOutlet private weak var abilityStackView: UIStackView!

    // MARK: - Properties

    private var pokemonDetail: PokemonDetailPresentation?
    var presenter: PokemonDetailPresenterProtocol!

    // MARK: - LifeCycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.load()
    }
}

// MARK: - Private Methods

private extension PokemonDetailVC {

    func updateUI() {
        navigationItem.title = pokemonDetail?.name?.capitalized

        if let imageUrl = pokemonDetail?.imageUrl,
           let url = URL(string: imageUrl) {
            pokemonImageView.kf.setImage(with: url)
        }

        pokemonDetail?.abilities?.forEach({ ability in
            let label = UILabel()
            label.textColor = .white
            label.text = ability
            abilityStackView.addArrangedSubview(label)
        })
    }
}

// MARK: - PokemonDetailVCProtocol

extension PokemonDetailVC: PokemonDetailVCProtocol {

    func handleOutput(_ output: PokemonDetailPresenterOutput) {
        switch output {
        case .setLoading(let isLoading):
            handleLoader(isLoading: isLoading)
            break
        case .showDetail(let pokemonDetailPresentation):
            self.pokemonDetail = pokemonDetailPresentation
            updateUI()
        }
    }
}
