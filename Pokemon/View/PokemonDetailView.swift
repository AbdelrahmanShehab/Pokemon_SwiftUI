//
//  PokemonDetailView.swift
//  Pokemon
//
//  Created by Abdelrahman Shehab on 05/05/2023.
//

import SwiftUI
import Kingfisher

struct PokemonDetailView: View {
    // MARK: -  PROPERTIES
    let pokemonViewModel: PokemonViewModel
    let pokemon: Pokemon
    
    // MARK: -  BODY
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(pokemonViewModel.pokemonBackgroundColor(for: pokemon.type)).opacity(0.6), Color(pokemonViewModel.pokemonBackgroundColor(for: pokemon.type)).opacity(0.2)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                // MARK: -  Pokemon Image
                KFImage(URL(string: pokemon.imageUrl))
                    .resizable()
                    .scaledToFit()
                    .shadow(color: Color(pokemonViewModel.pokemonBackgroundColor(for: pokemon.type)), radius: 5, x: 5, y: 5)
                    .frame(width: 250, height: 250, alignment: .center)
                    .padding()
                    .padding(.leading, 20)
                
                HStack {
                    // MARK: -  Pokemon Name
                    Text(pokemon.name.capitalized)
                        .font(.title)
                        .font(.system(size: 28, weight: .bold, design: .serif))
                    
                    // MARK: -  Pokemon Type
                    Text(pokemon.type.capitalized)
                        .font(.system(size: 16, weight: .medium, design: .serif))
                        .foregroundColor(.black)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .fill(Color(pokemonViewModel.pokemonBackgroundColor(for: pokemon.type)).opacity(0.3))
                        )
                        .frame(width: 100, height: 25)
                }//: HSTACK
                .padding(.leading)
                
                // MARK: -  Pokemon Description
                Text(pokemon.description)
                    .font(.system(size: 20, weight: .regular, design: .serif))
                
                Divider()
                
                // MARK: -  Pokemon Status Details
                VStack(alignment: .leading) {
                    
                    Details(key: "Type :", value: pokemon.type.capitalized, image: "cloud.sun.bolt.fill")
                    Details(key: "Height :", value: "\(pokemon.height)", image: "staroflife.circle.fill")
                    Details(key: "Weight :", value: "\(pokemon.weight) ", image: "sparkles" )
                    Details(key: "Attack :", value: "\(pokemon.attack)", image: "tropicalstorm")
                    Details(key: "Defense :", value: "\(pokemon.defense)", image: "bonjour")
                }.padding()
            }//: VSTACK
            .frame(width: 330, height: 670, alignment: .center)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .padding(.all, 8)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .shadow(color: .black.opacity(0.3), radius: 8, x: 8, y: 8)
            .shadow(color: .white.opacity(0.6), radius: 10, x: -10, y: -10)
        }//: ZSTACK
    }
}

struct Details: View {
    let key: String
    let value: String
    let image: String
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: image)
                .font(.system(size: 18, weight: .semibold, design: .serif))
            Text(key)
                .font(.system(size: 18, weight: .semibold, design: .serif))
            Text(value)
                .font(.system(size: 16, weight: .semibold, design: .serif))
        }//: HSTACK
    }
}

// MARK: -  PREVIEW
struct PokemonDetailView_Previews: PreviewProvider {
    
    static let sampleNPoke = Pokemon(id: 1, name: "test", imageUrl: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F2CF15848-AAF9-49C0-90E4-28DC78F60A78?alt=media&token=15ecd49b-89ff-46d6-be0f-1812c948e334", type: "fire", weight: 10, height: 10, attack: 10, defense: 10, description: "test another one")
    
    static let sampleNVM = PokemonViewModel()
    
    static var previews: some View {
        PokemonDetailView(pokemonViewModel: sampleNVM, pokemon: sampleNPoke)
    }
}
