extension Cube {
    public init?(_ string: String) {
        guard string.count == 54 else { return nil }

        let faceletMap: [Character: Facelet] = [
            string[4]: .up,
            string[13]: .down,
            string[22]: .right,
            string[31]: .left,
            string[40]: .front,
            string[49]: .back
        ]

        guard Set(faceletMap.keys).count == 6 else { return nil }

        var facelets = [Facelet]()
        for character in string {
            if let facelet = faceletMap[character] {
                facelets.append(facelet)
            } else {
                return nil
            }
        }

        self.init(facelets: facelets)
    }

    public var stringRepresentation: String {
        return facelets.map { $0.rawValue }.joined()
    }
}
