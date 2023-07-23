/// A turn of a cube.
///
/// There are 6 layers of the cube that can be turned: up, down, right, left, front, and back. Each layer can be
/// turned by a quarter, either clockwise or counterclockwise, or halfway. This means there are 18 possible
/// turn types.
///
/// ```swift
/// var cube: Cube = .solvedCube
///
/// // Perform a U perm.
/// cube.turn(.right(.clockwise))
/// cube.turn(.up(.counterclockwise))
/// cube.turn(.right(.clockwise))
/// cube.turn(.up(.clockwise))
/// cube.turn(.right(.clockwise))
/// cube.turn(.up(.clockwise))
/// cube.turn(.right(.clockwise))
/// cube.turn(.up(.counterclockwise))
/// cube.turn(.right(.counterclockwise))
/// cube.turn(.up(.counterclockwise))
/// cube.turn(.right(.half))
/// ```
public enum Turn: Equatable, Hashable {
    case up(Degree)
    case down(Degree)
    case right(Degree)
    case left(Degree)
    case front(Degree)
    case back(Degree)
    case standing(Degree)
    case middle(Degree)
    case equator(Degree)
    case upWide(Degree)
    case downWide(Degree)
    case rightWide(Degree)
    case leftWide(Degree)
    case frontWide(Degree)
    case backWide(Degree)
    case yAxis(Degree)
    case xAxis(Degree)
    case zAxis(Degree)
}

extension Turn {
    /// The degree of a turn.
    ///
    /// There are two quarter turns: clockwise and counterclockwise. There is one half turn, for which
    /// direction is irrelvant.
    public enum Degree: Int {
        case clockwise = 1, half, counterclockwise
    }
}
