//
//  PokemonListCell.swift
//  PokemonApp
//
//  Created by Samet Alemdaroğlu on 8.12.2022.
//

import UIKit
import Kingfisher

struct PokemonListCellModel {
    let imageUrl: String?
    let name: String?
}

final class PokemonListCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var pokemonImageView: UIImageView!
    @IBOutlet private weak var pokemonNameLabel: UILabel!

    // MARK: - Override Methods

    override func awakeFromNib() {
        super.awakeFromNib()

    }
}

// MARK: - Public Methods

extension PokemonListCell {

    func update(with model: PokemonListCellModel) {
        if let imageUrl = model.imageUrl,
           let url = URL(string: imageUrl) {
            pokemonImageView.kf.setImage(with: url)
        }
        pokemonNameLabel.text = model.name?.capitalized
    }
}
