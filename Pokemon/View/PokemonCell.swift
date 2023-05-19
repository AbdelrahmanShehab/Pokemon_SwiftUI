//
//  PokemonCell.swift
//  Pokemon
//
//  Created by Abdelrahman Shehab on 05/05/2023.
//

import SwiftUI
import Kingfisher

struct PokemonCell: View {
    // MARK: -  PROPERTIES
    let pokemon: Pokemon
    let pokemonViewModel: PokemonViewModel
    
    // MARK: -  BODY
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                /// Pokemon Name
                Text(pokemon.name.capitalized)
                    .font(.system(size: 20, weight: .semibold, design: .serif))
                    .foregroundColor(.black)
                    .padding(.top, 20)
                    .padding(.leading)
                
                /// Pokemon Type
                HStack {
                    Text(pokemon.type.capitalized)
                        .font(.system(size: 16, weight: .medium, design: .serif))
                        .foregroundColor(.black)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .fill(Color.white.opacity(0.2))
                        )
                        .frame(width: 100, height: 24)
                    
                    // Creating an Pokemon Image using Kingfisher Package
                    KFImage(URL(string: pokemon.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 65, height: 65, alignment: .leading)
                        .padding([.bottom, .trailing], 8)
                        
                }//: HSTACK
            }//: VSTACK
        }//: ZSTACK
        .background(
            Color(pokemonViewModel.pokemonBackgroundColor(for: pokemon.type)).opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .shadow(color: .gray.opacity(0.8), radius: 8, x: 8, y: 8)
        
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static let samplePokemon = Pokemon(id: 1, name: "test", imageUrl: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F2CF15848-AAF9-49C0-90E4-28DC78F60A78?alt=media&token=15ecd49b-89ff-46d6-be0f-1812c948e334", type: "fire", weight: 10, height: 10, attack: 10, defense: 10, description: "test another one")
    static let sampleVM = PokemonViewModel()
    
    static var previews: some View {
        PokemonCell(pokemon: samplePokemon, pokemonViewModel: sampleVM)
    }
}
