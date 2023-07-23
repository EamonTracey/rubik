import Foundation

@usableFromInline
class Thistlethwaite {
    private var tableOne: [String]?
    private var tableTwo: [String]?
    private var tableThree: [String]?
    private var tableFour: [String]?
    private var tablesLoaded: Bool = false
}

extension Thistlethwaite {
    @usableFromInline
    func solve(_ cube: Cube) -> Algorithm? {
        if !tablesLoaded {
            loadTables()
        }

        var cube = cube

        guard let one = tableOne?[encodeThistlethwaiteOne(cube)] else { return nil }
        guard let oneAlgorithm = Algorithm(compressedString: one) else { return nil }
        cube.execute(oneAlgorithm)

        guard let two = tableTwo?[encodeThistlethwaiteTwo(cube)] else { return nil }
        guard let twoAlgorithm = Algorithm(compressedString: two) else { return nil }
        cube.execute(twoAlgorithm)

        guard let three = tableThree?[encodeThistlethwaiteThree(cube)] else { return nil }
        guard let threeAlgorithm = Algorithm(compressedString: three) else { return nil }
        cube.execute(threeAlgorithm)

        guard let four = tableFour?[encodeThistlethwaiteFour(cube)] else { return nil }
        guard let fourAlgorithm = Algorithm(compressedString: four) else { return nil }
        cube.execute(fourAlgorithm)

        guard cube == .solvedCube else { return nil }

        return oneAlgorithm + twoAlgorithm + threeAlgorithm + fourAlgorithm
    }
}

extension Thistlethwaite {
    @usableFromInline
    func load(table name: String) -> [String]? {
        var table = [String]()

        guard let url = Bundle.module.url(
            forResource: "Tables/thistlethwaite_\(name)", withExtension: .none
        ) else { return nil }

        guard let fileHandle = fopen(url.relativePath, "r") else { return nil }
        var buffer = [CChar](repeating: 0, count: 32)

        while fgets(&buffer, 32, fileHandle) != nil {
            buffer[strlen(buffer) - 1] = 0
            table.append(String(cString: buffer))
        }

        fclose(fileHandle)

        return table
    }

    @usableFromInline
    func loadTables() {
        tableOne = load(table: "one")
        tableTwo = load(table: "two")
        tableThree = load(table: "three")
        tableFour = load(table: "four")
        tablesLoaded = true
    }

    @usableFromInline
    func unloadTables() {
        tableOne = nil
        tableTwo = nil
        tableThree = nil
        tableFour = nil
        tablesLoaded = false
    }
}
