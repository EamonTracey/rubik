import Foundation

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
        guard let oneAlgorithm = Algorithm(one) else { return nil }
        cube.execute(oneAlgorithm)

        guard let two = tableTwo?[encodeThistlethwaiteTwo(cube)] else { return nil }
        guard let twoAlgorithm = Algorithm(two) else { return nil }
        cube.execute(twoAlgorithm)

        guard let three = tableThree?[encodeThistlethwaiteThree(cube)] else { return nil }
        guard let threeAlgorithm = Algorithm(three) else { return nil }
        cube.execute(threeAlgorithm)

        guard let four = tableFour?[encodeThistlethwaiteFour(cube)] else { return nil }
        guard let fourAlgorithm = Algorithm(four) else { return nil }
        cube.execute(fourAlgorithm)

        return Algorithm("\(one) \(two) \(three) \(four)")
    }
}

extension Thistlethwaite {
    @usableFromInline
    func load(table name: String) -> [String]? {
        var table = [String]()

        // Get file URL of the stored table.
        guard let url = Bundle.module.url(
            forResource: "Tables/thistlethwaite_\(name)", withExtension: .none
        ) else { return nil }

        guard let fileHandle = fopen(url.relativePath, "r") else { return nil }
        var buffer = [CChar](repeating: 0, count: 64)

        // Read the file line by line.
        while fgets(&buffer, 64, fileHandle) != nil {
            // Remove the newline character.
            buffer[strlen(buffer) - 1] = 0

            // Add the algorithm to the table.
            table.append(String(cString: buffer))
        }

        // Close the file handle.
        fclose(fileHandle)

        return table
    }
}


extension Thistlethwaite {
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
    }
}
