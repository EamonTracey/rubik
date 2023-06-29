import Foundation

protocol ThistlethwaiteStep {
    static var name: String { get }
    static var factor: Int { get }
    static var allowedTurns: [Turn] { get }
    static func encode(_ cube: Cube) -> Int
}

extension ThistlethwaiteStep {
    static func generateTable() -> [Int: String] {
        return Solver.Thistlethwaite.traversal(
            factor: factor,
            allowedTurns: allowedTurns,
            stateEncoding: encode
        )
    }
}

extension ThistlethwaiteStep {
    static func loadTable() -> [Int: String]? {
        if let url = Bundle.module.url(forResource: "Tables/thistlethwaite_\(name)", withExtension: "json"),
          let data = try? Data(contentsOf: url), let dict = try? JSONDecoder().decode([Int: String].self, from: data) {
            return dict
        }
        return nil
    }
}
