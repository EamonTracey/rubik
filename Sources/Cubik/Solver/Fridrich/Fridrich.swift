import Foundation

@usableFromInline
class Fridrich {
    private var crossTable: [String]?
    private var tablesLoaded: Bool = false
}

extension Fridrich {
    @usableFromInline
    func solve(_ cube: Cube) -> Algorithm? {
        if !tablesLoaded {
            loadTables()
        }

        var cube = cube

        guard let cross = crossTable?[encodeCross(cube)] else { return nil }
        guard let crossAlgorithm = Algorithm(compressedString: cross) else { return nil }
        cube.execute(crossAlgorithm)

        return crossAlgorithm
    }
}

extension Fridrich {
    @usableFromInline
    func load(table name: String) -> [String]? {
        var table = [String]()

        guard let url = Bundle.module.url(
            forResource: "Tables/fridrich_\(name)", withExtension: .none
        ) else { return nil }

        guard let fileHandle = fopen(url.relativePath, "r") else { return nil }
        var buffer = [CChar](repeating: 0, count: 64)

        while fgets(&buffer, 9, fileHandle) != nil {
            buffer[strlen(buffer) - 1] = 0
            table.append(String(cString: buffer))
        }

        fclose(fileHandle)

        return table
    }

    @usableFromInline
    func loadTables() {
        crossTable = load(table: "cross")
        tablesLoaded = true
    }

    @usableFromInline
    func unloadTables() {
        crossTable = nil
        tablesLoaded = false
    }
}
