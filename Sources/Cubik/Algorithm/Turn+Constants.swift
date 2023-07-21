extension Turn {
    public static let outerTurns: [Turn] = [
        .up(.clockwise), .up(.half), .up(.counterclockwise),
        .down(.clockwise), .down(.half), .down(.counterclockwise),
        .right(.clockwise), .right(.half), .right(.counterclockwise),
        .left(.clockwise), .left(.half), .left(.counterclockwise),
        .front(.clockwise), .front(.half), .front(.counterclockwise),
        .back(.clockwise), .back(.half), .back(.counterclockwise)
    ]

    public static let sliceTurns: [Turn] = [
        .standing(.clockwise), .standing(.half), .standing(.counterclockwise),
        .middle(.clockwise), .middle(.half), .middle(.counterclockwise),
        .equator(.clockwise), .equator(.half), .equator(.counterclockwise)
    ]
}
