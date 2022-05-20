
import UIKit

extension PokemonType {
    
    func cardColor() -> UIColor {
        switch self.name {
        case .none:
            return Colors.none
        case .normal:
            return Colors.normal
        case .grass:
            return Colors.grass
        case .poison:
            return Colors.poison
        case .fire:
            return Colors.fire
        case .psychic:
            return Colors.psychic
        case .flying:
            return Colors.flying
        case .ice:
            return Colors.ice
        case .bug:
            return Colors.bug
        case .rock:
            return Colors.rock
        case .water:
            return Colors.water
        case .electric:
            return Colors.electric
        case .ground:
            return Colors.ground
        case .fairy:
            return Colors.fairy
        case .steel:
            return Colors.steel
        case .fighting:
            return Colors.fighting
        case .dragon:
            return Colors.dragon
        case .ghost:
            return Colors.ghost
        }
    }
    
    func badgeColor() -> UIColor {
        switch self.name {
        case .none:
            return Colors.badgeNone
        case .normal:
            return Colors.badgeNormal
        case .grass:
            return Colors.badgeGrass
        case .poison:
            return Colors.badgePoison
        case .fire:
            return Colors.badgeFire
        case .psychic:
            return Colors.badgePsychic
        case .flying:
            return Colors.badgeFlying
        case .ice:
            return Colors.badgeIce
        case .bug:
            return Colors.badgeBug
        case .rock:
            return Colors.badgeRock
        case .water:
            return Colors.badgeWater
        case .electric:
            return Colors.badgeElectric
        case .ground:
            return Colors.badgeGround
        case .fairy:
            return Colors.badgeFairy
        case .steel:
            return Colors.badgeSteel
        case .fighting:
            return Colors.badgeFighting
        case .dragon:
            return Colors.badgeDragon
        case .ghost:
            return Colors.badgeGhost
        }
    }
}
