extension Cube {
    public init?(_ string: String) {
        guard string.count == 54 else { return nil }
        guard Set([string[4], string[13], string[22], string[31], string[40], string[49]]).count == 6 else {
            return nil
        }

        let faceletMap: [Character: Facelet] = [
            string[4]: .up,
            string[13]: .down,
            string[22]: .right,
            string[31]: .left,
            string[40]: .front,
            string[49]: .back
        ]

        var facelets = [Facelet]()
        for character in string {
            guard let facelet = faceletMap[character] else { return nil }
            facelets.append(facelet)
        }

        self.init(facelets: facelets)
    }

    public var stringRepresentation: String {
        return facelets.map { $0.rawValue }.joined()
    }
}
