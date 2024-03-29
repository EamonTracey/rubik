@usableFromInline
func solveOLL(_ cube: Cube) -> Algorithm {
    var cube = cube

    for ollAlgorithm in ollAlgorithms {
        for auf in [Algorithm.nothing, Algorithm("U")!, Algorithm("U2")!, Algorithm("U'")!] {
            let ollSolution = auf + ollAlgorithm

            cube.execute(ollSolution)
            if cube.areEdgesOriented && cube.areCornersOriented { return ollSolution }
            cube.execute(ollSolution.reversed)
        }
    }

    fatalError("OLL failed. This is a bug.")
}

fileprivate var ollAlgorithms: [Algorithm] = [
    .nothing,
    Algorithm("R U2 R' R' F R F' U2 R' F R F'")!,
    Algorithm("r U r' U2 r U2 R' U2 R U' r'")!,
    Algorithm("r' R2 U R' U r U2 r' U M'")!,
    Algorithm("M U' r U2 r' U' R U' R' M'")!,
    Algorithm("l' U2 L U L' U l")!,
    Algorithm("r U2 R' U' R U' r'")!,
    Algorithm("r U R' U R U2 r'")!,
    Algorithm("l' U' L U' L' U2 l")!,
    Algorithm("R U R' U' R' F R2 U R' U' F'")!,
    Algorithm("R U R' U R' F R F' R U2 R'")!,
    Algorithm("r U R' U R' F R F' R U2 r'")!,
    Algorithm("M' R' U' R U' R' U2 R U' R r'")!,
    Algorithm("F U R U' R2 F' R U R U' R'")!,
    Algorithm("R' F R U R' F' R F U' F'")!,
    Algorithm("l' U' l L' U' L U l' U l")!,
    Algorithm("r U r' R U R' U' r U' r'")!,
    Algorithm("F R' F' R2 r' U R U' R' U' M'")!,
    Algorithm("r U R' U R U2 r' r' U' R U' R' U2 r")!,
    Algorithm("r' R U R U R' U' M' R' F R F'")!,
    Algorithm("r U R' U' M2 U R U' R' U' M'")!,
    Algorithm("R U2 R' U' R U R' U' R U' R'")!,
    Algorithm("R U2 R2 U' R2 U' R2 U2 R")!,
    Algorithm("R2 D' R U2 R' D R U2 R")!,
    Algorithm("r U R' U' r' F R F'")!,
    Algorithm("F' r U R' U' r' F R")!,
    Algorithm("R U2 R' U' R U' R'")!,
    Algorithm("R U R' U R U2 R'")!,
    Algorithm("r U R' U' r' R U R U' R'")!,
    Algorithm("R U R' U' R U' R' F' U' F R U R'")!,
    Algorithm("F R' F R2 U' R' U' R U R' F2")!,
    Algorithm("R' U' F U R U' R' F' R")!,
    Algorithm("L U F' U' L' U L F L'")!,
    Algorithm("R U R' U' R' F R F'")!,
    Algorithm("R U R2 U' R' F R U R U' F'")!,
    Algorithm("R U2 R' R' F R F' R U2 R'")!,
    Algorithm("L' U' L U' L' U L U L F' L' F")!,
    Algorithm("F R' F' R U R U' R'")!,
    Algorithm("R U R' U R U' R' U' R' F R F'")!,
    Algorithm("L F' L' U' L U F U' L'")!,
    Algorithm("R' F R U R' U' F' U R")!,
    Algorithm("R U R' U R U2 R' F R U R' U' F'")!,
    Algorithm("R' U' R U' R' U2 R F R U R' U' F'")!,
    Algorithm("F' U' L' U L F")!,
    Algorithm("F U R U' R' F'")!,
    Algorithm("F R U R' U' F'")!,
    Algorithm("R' U' R' F R F' U R")!,
    Algorithm("R' U' R' F R F' R' F R F' U R")!,
    Algorithm("F R U R' U' R U R' U' F'")!,
    Algorithm("r U' r2 U r2 U r2 U' r")!,
    Algorithm("r' U r2 U' r2 U' r2 U r'")!,
    Algorithm("F U R U' R' U R U' R' F'")!,
    Algorithm("R U R' U R U' B U' B' R'")!,
    Algorithm("l' U2 L U L' U' L U L' U l")!,
    Algorithm("r U2 R' U' R U R' U' R U' r'")!,
    Algorithm("R' F R U R U' R2 F' R2 U' R' U R U R'")!,
    Algorithm("r' U' r U' R' U R U' R' U R r' U r")!,
    Algorithm("R U R' U' M' U R U' r'")!
]
