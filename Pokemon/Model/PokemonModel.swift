//
//  PokemonModel.swift
//  Pokemon
//
//  Created by Abdelrahman Shehab on 05/05/2023.
//

import Foundation

struct Pokemon: Identifiable, Codable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
    let weight: Int
    let height: Int
    let attack: Int
    let defense: Int
    let description: String
}
