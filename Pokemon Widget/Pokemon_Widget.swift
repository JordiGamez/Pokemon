
import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), pokemon: createPokemon())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), pokemon: createPokemon())
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let currentDate = Date()
        let midnight = Calendar.current.startOfDay(for: currentDate)
        let nextMidnight = Calendar.current.date(byAdding: .day, value: 1, to: midnight)!
        
        let entries = [
            SimpleEntry(date: currentDate, pokemon: createPokemon())
        ]
        
        let timeline = Timeline(entries: entries, policy: .after(nextMidnight))
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let pokemon: Pokemon
}

struct Pokemon_WidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        Text(entry.date, style: .time)
    }
}

@main
struct Pokemon_Widget: Widget {
    let kind: String = "Pokemon_Widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WidgetView(data: WidgetData(pokemon: entry.pokemon,
                                        date: entry.date))
        }
    }
}

struct Pokemon_Widget_Previews: PreviewProvider {
    static var previews: some View {
        Pokemon_WidgetEntryView(entry: SimpleEntry(date: Date(),
                                                   pokemon: createPokemon()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

private func createPokemon() -> Pokemon {
    .init(number: "25",
          name: "pikachu",
          url: "https://pokeapi.co/api/v2/pokemon/25/",
          imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png")
}
