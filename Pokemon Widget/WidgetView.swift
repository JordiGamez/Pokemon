
import SwiftUI
import WidgetKit
import Kingfisher

struct WidgetData{
    let pokemon: Pokemon
    let date: Date
}

extension WidgetData{
    static let previewData = WidgetData(pokemon: createPokemon(),
                                        date: Date())
}

struct WidgetView: View {
    let data: WidgetData
    
    var body: some View {
        ZStack {
            Color.gray
            VStack {
                KFImage(URL(string: data.pokemon.imageUrl)!)
                    .loadDiskFileSynchronously()
                    .cacheMemoryOnly()
                    .fade(duration: 0.25)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("#\(data.pokemon.number) \(data.pokemon.name.uppercased())")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
            }
            .padding(4)
        }
    }
}

struct WidgetView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WidgetView(data: .previewData)
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            WidgetView(data: .previewData)
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            WidgetView(data: .previewData)
                .previewContext(WidgetPreviewContext(family: .systemLarge))
        }
    }
}

private func createPokemon() -> Pokemon {
    .init(number: "25",
          name: "pikachu",
          url: "https://pokeapi.co/api/v2/pokemon/25/",
          imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png")
}
