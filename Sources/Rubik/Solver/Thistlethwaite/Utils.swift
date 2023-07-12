@usableFromInline
func combinations(_ n: Int, _ r: Int) -> Int {
    if r > n {
        return 0
    }
    var result = 1
    for i in 0..<min(r, n - r) {
        result = (result * (n - i)) / (i + 1)
    }
    return result
}

@usableFromInline
func encodeCombination<T>(of elements: [T], satisfying isChosen: @escaping (T) -> (Bool)) -> Int {
    var combination = 0
    var r = 1
    for (index, element) in elements.enumerated() where isChosen(element) {
        combination += combinations(index, r)
        r += 1
    }
    return combination
}

@usableFromInline
func encodePermutation<T: Comparable>(of elements: ArraySlice<T>, n: Int) -> Int {
    var permutation = 0
    for (index, elementA) in elements[..<(n + elements.startIndex)].enumerated() {
        permutation *= elements.count - index
        for elementB in elements[(index + elements.startIndex)...] where elementA > elementB {
            permutation += 1
        }
    }
    return permutation
}

@usableFromInline
func tetradTwist(_ cube: Cube) -> Int {
    var firsts: [Cube.Corner.Position] = []
    var seconds: [Cube.Corner.Position] = []

    for corner in cube.corners {
        if corner.tetrad == .first {
            firsts.append(corner.solvedPosition)
        } else {
            seconds.append(corner.solvedPosition)
        }
    }

    var corners = firsts + seconds

    // Solve URF.
    if corners[0] == .upLeftBack { transform(corners: &corners, by: .up(.half)) }
    else if corners[0] == .downRightBack { transform(corners: &corners, by: .right(.half)) }
    else if corners[0] == .downLeftFront { transform(corners: &corners, by: .front(.half)) }
    // Solve ULB.
    if corners[1] == .downRightBack { transform(corners: &corners, by: .back(.half)) }
    else if corners[1] == .downLeftFront { transform(corners: &corners, by: .left(.half)) }
    // Solve DRB and DLF.
    if corners[2] == .downLeftFront { transform(corners: &corners, by: .down(.half)) }
    // Solve URB.
    if corners[4] == .upLeftFront {
        transform(corners: &corners, by: .up(.half))
        transform(corners: &corners, by: .left(.half))
        transform(corners: &corners, by: .front(.half))
        transform(corners: &corners, by: .left(.half))
    }
    else if corners[4] == .downRightFront {
        transform(corners: &corners, by: .right(.half))
        transform(corners: &corners, by: .down(.half))
        transform(corners: &corners, by: .front(.half))
        transform(corners: &corners, by: .down(.half))
    }
    else if corners[4] == .downLeftBack {
        transform(corners: &corners, by: .back(.half))
        transform(corners: &corners, by: .right(.half))
        transform(corners: &corners, by: .up(.half))
        transform(corners: &corners, by: .right(.half))
    }

    switch corners[5...7].map({ $0.rawValue - 5 }) {
    case [0, 1, 2]: return 0
    case [0, 2, 1]: return 1
    case [1, 0, 2]: return 2
    case [1, 2, 0]: return 3
    case [2, 0, 1]: return 4
    default:        return 5
    }
}

@usableFromInline
func transform(corners: inout [Cube.Corner.Position], by turn: Turn) {
    var indices: [Int] = .init(repeating: 0, count: 4)
    var positions: [Int] = .init(repeating: 0, count: 4)

    switch turn {
    case .up(.half):    indices = [1,0,5,4]
    case .down(.half):  indices = [3,2,7,6]
    case .left(.half):  indices = [1,3,5,7]
    case .right(.half): indices = [2,0,6,4]
    case .front(.half): indices = [3,0,5,6]
    default:            indices = [1,2,7,4]
    }

    for i in 0..<8 {
        if corners[i].rawValue == indices[0] { positions[0] = i }
        if corners[i].rawValue == indices[1] { positions[1] = i }
        if corners[i].rawValue == indices[2] { positions[2] = i }
        if corners[i].rawValue == indices[3] { positions[3] = i }
    }

    corners.swapAt(positions[0], positions[1])
    corners.swapAt(positions[2], positions[3])
}
