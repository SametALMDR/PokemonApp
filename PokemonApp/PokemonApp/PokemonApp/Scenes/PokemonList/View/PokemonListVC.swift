//
//  PokemonListVC.swift
//  PokemonApp
//
//  Created by Samet Alemdaroğlu on 7.12.2022.
//

import UIKit

final class PokemonListVC: BaseVC {

    // MARK: - IBOutlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties

    private var pokemons: [PokemonPresentation] = []
    var presenter: PokemonListPresenterProtocol!

    // MARK: - LifeCycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.load()
    }
}

// MARK: - Setup

extension PokemonListVC {

    private func setupUI() {
        navigationItem.title = "Pokemons"
        setupTableView()
    }

    private func setupTableView() {
        PokemonListCell.register(to: tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDataSource

extension PokemonListVC: UITableViewDataSource {

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        pokemons.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell: PokemonListCell = tableView.dequeueCell(for: indexPath)
        let pokemon = pokemons[indexPath.row]
        let model = PokemonListCellModel(imageUrl: pokemon.imageUrl, name: pokemon.name)
        cell.update(with: model)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension PokemonListVC: UITableViewDelegate {

    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        presenter.selectPokemon(at: indexPath.row)
    }
}

// MARK: - PokemonListVCProtocol

extension PokemonListVC: PokemonListVCProtocol {

    func handleOutput(_ output: PokemonListPresenterOutput) {
        switch output {
        case .setLoading(let isLoading):
            handleLoader(isLoading: isLoading)
            break
        case .showPokemonList(let pokemons):
            self.pokemons = pokemons
            tableView.reloadData()
        }
    }
}
