//
//  PokemonViewModel.swift
//  Pokemon
//
//  Created by Abdelrahman Shehab on 05/05/2023.
//

import Foundation
import SwiftUI

// MARK: -  Pokemon View Model
class PokemonViewModel: ObservableObject {
    // Object of Pokemon Model
    @Published var pokemon = [Pokemon]()
    
    // Create url of API
    let pokemonURL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    // Initiate Fetch Method to Call API
    
    init() {
        fetchData()
    }
    
    // MARK: -  FETCH DATA FROM API
    func fetchData() {
        
        // Fetch Data from URL
        guard let url = URL(string: pokemonURL) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            // Remove Extra String and null from Data
            guard let  data = data?.parseData(removeString: "null,") else { return }
            
            guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else { return }
            
            // Store Data
            DispatchQueue.main.async {
                self.pokemon = pokemon
            }
        }.resume()
    }
    
    // MARK: -  Method to Add Specified Background based on the Pokemon Type
    func pokemonBackgroundColor(for type: String) -> UIColor {
        switch type {
        case "fire" : return .orange
        case "poison": return .purple
        case "water": return .blue
        case "electric": return .yellow
        case "psychic": return .brown
        case "normal": return .magenta
        case "ground": return .green
        case "flying": return .cyan
        case "fairy": return .systemTeal
        default: return .systemPink

        }
    }
}

// MARK: -  Rmoving null and String format from retrived Data

extension Data {
    func parseData(removeString string: String) -> Data? {
        
        let dataAsString = String(data: self, encoding: .utf8)
        
        // Replacing the Occurance of unwanted String(sentances) with ""
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        
        // Return Data in the form of UTF8 format
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        
        return data
    }
}
