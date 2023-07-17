extension Turn: CaseIterable {
    /// All turns that can be applied to a cube.
    public static var allCases: [Turn] {
        return [
            .up(.clockwise), .up(.half), .up(.counterclockwise),
            .down(.clockwise), .down(.half), .down(.counterclockwise),
            .right(.clockwise), .right(.half), .right(.counterclockwise),
            .left(.clockwise), .left(.half), .left(.counterclockwise),
            .front(.clockwise), .front(.half), .front(.counterclockwise),
            .back(.clockwise), .back(.half), .back(.counterclockwise)
        ]
    }
}
