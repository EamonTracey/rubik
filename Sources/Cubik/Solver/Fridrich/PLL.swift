func solvePLL(_ cube: Cube) -> Algorithm {
    return .nothing
}

fileprivate var pllAlgorithms: [Algorithm] = [
    .nothing,
    Algorithm("x L2 D2 L' U' L D2 L' U L'")!,
    Algorithm("x' L2 D2 L U L' D2 L U' L")!,
    Algorithm("x' L' U L D' L' U' L D L' U' L D' L' U L D")!,
    Algorithm("R' U' F' R U R' U' R' F R2 U' R' U' R U R' U R")!,
    Algorithm("R2 U R' U R' U' R U' R2 U' D R' U R D'")!,
    Algorithm("R' U' R U D' R2 U R' U R U' R U' R2 D")!,
    Algorithm("R2 U' R U' R U R' U R2 U D' R U' R' D")!,
    Algorithm("R U R' U' D R2 U' R U' R' U R' U R2 D'")!,
    Algorithm("M2 U M2 U2 M2 U M2")!,
    Algorithm("x R2 F R F' R U2 r' U r U2")!,
    Algorithm("R U R' F' R U R' U' R' F R2 U' R'")!,
    Algorithm("R U R' U R U R' F' R U R' U' R' F R2 U' R' U2 R U' R'")!,
    Algorithm("R' U R U' R' F' U' F R U R' F R' F' R U' R")!,
    Algorithm("R U' R' U' R U R D R' U' R D' R' U2 R'")!,
    Algorithm("R2 F R U R U' R' F' R U2 R' U2 R")!,
    Algorithm("R U R' U' R' F R2 U' R' U' R U R' F'")!,
    Algorithm("M2 U M U2 M' U M2")!,
    Algorithm("M2 U' M U2 M' U' M2")!,
    Algorithm("R' U R' U' y R' F' R2 U' R' U R' F R F")!,
    Algorithm("F R U' R' U' R U R' F' R U R' U' R' F R F'")!,
    Algorithm("M' U M2 U M2 U M' U2 M2")!,
]
