func combinations(_ n: Int, _ r: Int) -> Int {
    if r > n { return 0 }
    var result = 1
    for i in 0..<min(r, n - r) {
        result = (result * (n - i)) / (i + 1)
    }
    return result
}
