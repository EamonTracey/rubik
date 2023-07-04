extension Solver.Thistlethwaite {
    enum Three { }
}
func mod(_ a: Int, _ n: Int) -> Int {
    precondition(n > 0, "modulus must be positive")
    let r = a % n
    return r >= 0 ? r : r + n
}
extension Solver.Thistlethwaite.Three: ThistlethwaiteStep {
    static let name = "three"

    static let factor: Int = 29400

    static let allowedTurns: [Turn] = [
        .up(.clockwise), .up(.half), .up(.counterclockwise),
        .down(.clockwise), .down(.half), .down(.counterclockwise),
        .right(.half),
        .left(.half),
        .front(.half),
        .back(.half)
    ]

    @usableFromInline
    static func encode(_ cube: Cube) -> Int {
        var middleSliceCombination: Int = 0
        var firstTetradCombination: Int = 0

        var r = 1
        for (index, edge) in cube.edges[0...7].enumerated() where edge.slice == .middle {
            middleSliceCombination += binomial(index, r)
            r += 1
        }

        r = 1
        for (index, corner) in cube.corners.enumerated() where corner.tetrad == .first {
            firstTetradCombination += binomial(index, r)
            r += 1
        }
        firstTetradCombination *= 70

        let tt = tetradTwist(cube) * 4900

        return middleSliceCombination + firstTetradCombination + tt
    }
}


func tetradTwist(_ cube: Cube) -> Int {
    var firsts = [Int]()
    var seconds = [Int]()
    var perm = [Int]()

    for corner in cube.corners { if corner.tetrad == .first { firsts.append(corner.solvedPosition.rawValue) } else { seconds.append(corner.solvedPosition.rawValue) } }

    perm.append(contentsOf: firsts)
    perm.append(contentsOf: seconds)

    let code = ind(lehmer(perm: perm))

    if NO_PARITY_NO_CYCLE.contains(code) {  return 0 }
    else if NO_PARITY_1_CYCLE.contains(code) { return 1 }
    else if NO_PARITY_2_CYCLE.contains(code) { return 2 }
    else if PARITY_NO_CYCLE.contains(code) { return 3 }
    else if PARITY_1_CYCLE.contains(code) { return 4 }
    else if PARITY_2_CYCLE.contains(code) { return 5 }
    else { fatalError("wtf???") }
}

fileprivate var NO_PARITY_NO_CYCLE = [0, 7, 16, 23, 121, 126, 137, 142, 722, 730, 733, 741, 843, 851, 852, 860, 1444, 1448, 1455, 1459, 1565, 1569, 1574, 1578, 5041, 5046, 5057, 5062, 5160, 5167, 5176, 5183, 5764, 5768, 5775, 5779, 5885, 5889, 5894, 5898, 6482, 6490, 6493, 6501, 6603, 6611, 6612, 6620, 10083, 10091, 10092, 10100, 10202, 10210, 10213, 10221, 10805, 10809, 10814, 10818, 10924, 10928, 10935, 10939, 11520, 11527, 11536, 11543, 11641, 11646, 11657, 11662, 15125, 15129, 15134, 15138, 15244, 15248, 15255, 15259, 15843, 15851, 15852, 15860, 15962, 15970, 15973, 15981, 16561, 16566, 16577, 16582, 16680, 16687, 16696, 16703]

fileprivate var NO_PARITY_1_CYCLE = [4, 8, 15, 19, 125, 129, 134, 138, 721, 726, 737, 742, 840, 847, 856, 863, 1443, 1451, 1452, 1460, 1562, 1570, 1573, 1581, 5045, 5049, 5054, 5058, 5164, 5168, 5175, 5179, 5763, 5771, 5772, 5780, 5882, 5890, 5893, 5901, 6481, 6486, 6497, 6502, 6600, 6607, 6616, 6623, 10080, 10087, 10096, 10103, 10201, 10206, 10217, 10222, 10802, 10810, 10813, 10821, 10923, 10931, 10932, 10940, 11524, 11528, 11535, 11539, 11645, 11649, 11654, 11658, 15122, 15130, 15133, 15141, 15243, 15251, 15252, 15260, 15840, 15847, 15856, 15863, 15961, 15966, 15977, 15982, 16565, 16569, 16574, 16578, 16684, 16688, 16695, 16699]

fileprivate var NO_PARITY_2_CYCLE = [3, 11, 12, 20, 122, 130, 133, 141, 725, 729, 734, 738, 844, 848, 855, 859, 1440, 1447, 1456, 1463, 1561, 1566, 1577, 1582, 5042, 5050, 5053, 5061, 5163, 5171, 5172, 5180, 5760, 5767, 5776, 5783, 5881, 5886, 5897, 5902, 6485, 6489, 6494, 6498, 6604, 6608, 6615, 6619, 10084, 10088, 10095, 10099, 10205, 10209, 10214, 10218, 10801, 10806, 10817, 10822, 10920, 10927, 10936, 10943, 11523, 11531, 11532, 11540, 11642, 11650, 11653, 11661, 15121, 15126, 15137, 15142, 15240, 15247, 15256, 15263, 15844, 15848, 15855, 15859, 15965, 15969, 15974, 15978, 16562, 16570, 16573, 16581, 16683, 16691, 16692, 16700]

fileprivate var PARITY_NO_CYCLE = [1, 6, 17, 22, 120, 127, 136, 143, 724, 728, 735, 739, 845, 849, 854, 858, 1442, 1450, 1453, 1461, 1563, 1571, 1572, 1580, 5040, 5047, 5056, 5063, 5161, 5166, 5177, 5182, 5762, 5770, 5773, 5781, 5883, 5891, 5892, 5900, 6484, 6488, 6495, 6499, 6605, 6609, 6614, 6618, 10085, 10089, 10094, 10098, 10204, 10208, 10215, 10219, 10803, 10811, 10812, 10820, 10922, 10930, 10933, 10941, 11521, 11526, 11537, 11542, 11640, 11647, 11656, 11663, 15123, 15131, 15132, 15140, 15242, 15250, 15253, 15261, 15845, 15849, 15854, 15858, 15964, 15968, 15975, 15979, 16560, 16567, 16576, 16583, 16681, 16686, 16697, 16702]

fileprivate var PARITY_1_CYCLE = [2, 10, 13, 21, 123, 131, 132, 140, 720, 727, 736, 743, 841, 846, 857, 862, 1445, 1449, 1454, 1458, 1564, 1568, 1575, 1579, 5043, 5051, 5052, 5060, 5162, 5170, 5173, 5181, 5765, 5769, 5774, 5778, 5884, 5888, 5895, 5899, 6480, 6487, 6496, 6503, 6601, 6606, 6617, 6622, 10081, 10086, 10097, 10102, 10200, 10207, 10216, 10223, 10804, 10808, 10815, 10819, 10925, 10929, 10934, 10938, 11522, 11530, 11533, 11541, 11643, 11651, 11652, 11660, 15124, 15128, 15135, 15139, 15245, 15249, 15254, 15258, 15841, 15846, 15857, 15862, 15960, 15967, 15976, 15983, 16563, 16571, 16572, 16580, 16682, 16690, 16693, 16701]

fileprivate var PARITY_2_CYCLE = [5, 9, 14, 18, 124, 128, 135, 139, 723, 731, 732, 740, 842, 850, 853, 861, 1441, 1446, 1457, 1462, 1560, 1567, 1576, 1583, 5044, 5048, 5055, 5059, 5165, 5169, 5174, 5178, 5761, 5766, 5777, 5782, 5880, 5887, 5896, 5903, 6483, 6491, 6492, 6500, 6602, 6610, 6613, 6621, 10082, 10090, 10093, 10101, 10203, 10211, 10212, 10220, 10800, 10807, 10816, 10823, 10921, 10926, 10937, 10942, 11525, 11529, 11534, 11538, 11644, 11648, 11655, 11659, 15120, 15127, 15136, 15143, 15241, 15246, 15257, 15262, 15842, 15850, 15853, 15861, 15963, 15971, 15972, 15980, 16564, 16568, 16575, 16579, 16685, 16689, 16694, 16698]

func ind(_ lehmer: [Int]) -> Int {
    var lehmind = 0
    for (i, value) in lehmer.enumerated() {
        lehmind += value * factorial(lehmer.count - i - 1)
    }
    return lehmind
}
func factorial(_ n: Int) -> Int {
    return n == 0 ? 1 : n * factorial(n-1)
}

func lehmer(perm: [Int]) -> [Int] {
    var lehmer = perm

    for i in 1..<perm.count {
        var j = i
        while j != -1 {
            if perm[j] < perm[i] {
                lehmer[i] -= 1
            }
            j -= 1
        }
    }

    return lehmer
}
