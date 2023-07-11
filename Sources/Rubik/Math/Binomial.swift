@usableFromInline
func combinations(_ n: Int, _ r: Int) -> Int {
    if r > n { return 0 }
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

//@usableFromInline
//func encodePermutation<T: Comparable>(of elements: Array, n: Int) {
//    var permutation = 0
//    for (index, elementA) in elements[..<n].enumerated() {
//        permutation *= elements.count - index
//        for elementB in elements where elementA > elementB {
//            permutation += 1
//        }
//    }
//}
