platform :ios, '14.0'
use_frameworks!

target 'Pokemon' do
  
  pod 'RxSwift', '~> 6.5'
  pod 'Swinject', '~> 2.8'
  pod 'Kingfisher', '~> 7.0'
  pod 'SwiftLint', '~> 0.47'
  
  target 'PokemonTests' do
    inherit! :search_paths
    pod 'SwiftyMocky', '~> 4.0.0'
    pod 'RxTest', '~> 6.5'
    pod 'RxBlocking', '~> 6.5'
  end
  
  target 'PokemonSnapshotTests' do
    inherit! :search_paths
    pod 'SnapshotTesting', '~> 1.9'
  end
  
  target 'Pokemon WidgetExtension' do
    inherit! :search_paths
  end
  
end
