import ArgumentParser
import Cubik

struct CubeIterator: IteratorProtocol, Sequence {
    let noCubes: Bool
    var cubesIterator: IndexingIterator<[Cube]>

    init(cubes: [Cube]) {
        self.noCubes = cubes.isEmpty
        self.cubesIterator = cubes.makeIterator()
    }

    mutating func next() -> Cube? {
        if noCubes {
            while let line = readLine(strippingNewline: true) {
                return try? stringToCube(line)
            }
        }
        return cubesIterator.next()
    }
}

func stringToCube(_ string: String) throws -> Cube {
    if let cube = Cube(string) {
        return cube
    } else if let scramble = Algorithm(string) {
        var cube = Cube.solvedCube
        cube.execute(scramble)
        return cube
    }
    throw ValidationError("The provided string represents neither a cube nor an algorithm.")
}
