//
//  SamplePokemonView.swift
//  SampleSwiftUI2 (iOS)
//
//  Created by fuwamaki on 2024/07/18.
//

import SwiftUI

struct SamplePokemonView: View {
    @StateObject private var viewModel = PokemonViewModel()


    let columns: [GridItem] = [GridItem(.adaptive(minimum: 100, maximum: 150))]

    var body: some View {
        VStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.pokemons) { pokemon in
                        LazyVStack {
                            Text(pokemon.name)
                                .font(.caption)
                            AsyncImage(url: pokemon.imgUrl) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 100)
                            } placeholder: {
                                ProgressView()
                            }
                        }
                        .padding()
                        .frame(minHeight: 150)
                    }
                }
                .padding()
            }
        }
    }
}

struct Pokemon: Identifiable, Decodable {
    let id: Int
    let name: String
    let img: String

    var imgUrl: URL? {
        URL(string: img)
    }
}

class PokemonViewModel: ObservableObject {
    @Published var pokemons: [Pokemon] = []

    init() {
        if let fileUrl = Bundle.main.url(forResource: "pokemon-data", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileUrl)
                self.pokemons = try JSONDecoder().decode([Pokemon].self, from: data)
            } catch {
                print("Error decoding JSON: \(error)")
            }
        } else {
            print("File pokemon-data.json not found")
        }
    }
}

struct SamplePokemonView_Previews: PreviewProvider {
    static var previews: some View {
        SamplePokemonView()
    }
}
