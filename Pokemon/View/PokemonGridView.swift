//
//  PokemonGridView.swift
//  Pokemon
//
//  Created by Abdelrahman Shehab on 05/05/2023.
//

import SwiftUI

struct PokemonGridView: View {
    // MARK: -  PROPERTIES
    /// Grid Items for Lazy Grid View
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    /// Object for View Model
    @ObservedObject private var pokemonViewModel = PokemonViewModel()
    
    // MARK: -  BODY
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.green.opacity(0.2), .pink.opacity(0.3)]), startPoint: .topTrailing, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    LazyVGrid(columns: gridItems, spacing: 16) {
                        // Parsing all Data from API and The Model
                        ForEach(pokemonViewModel.pokemon) { pokemon in
                            NavigationLink(destination: PokemonDetailView(pokemonViewModel: pokemonViewModel, pokemon: pokemon)) {
                                PokemonCell(pokemon: pokemon, pokemonViewModel: pokemonViewModel)
                            }//: NAVIGATION LINK
                        }//: LOOP
                    }//: LAZY GRID
                    
                }//: SCROLL
                .navigationTitle("Pokemon Club \(pokemonViewModel.pokemon.count)")
            }//: NAVIGATION
            .navigationBarHidden(true)
        }
    }
    
    // MARK: -  PREVIEW
    struct PokemonGridView_Previews: PreviewProvider {
        static var previews: some View {
            PokemonGridView()
        }
    }
}
