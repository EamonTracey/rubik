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

    public static let wideTurns: [Turn] = [
        .upWide(.clockwise), .upWide(.half), .upWide(.counterclockwise),
        .downWide(.clockwise), .downWide(.half), .downWide(.counterclockwise),
        .rightWide(.clockwise), .rightWide(.half), .rightWide(.counterclockwise),
        .leftWide(.clockwise), .leftWide(.half), .leftWide(.counterclockwise),
        .frontWide(.clockwise), .frontWide(.half), .frontWide(.counterclockwise),
        .backWide(.clockwise), .backWide(.half), .backWide(.counterclockwise),
    ]

    public static let rotationTurns: [Turn] = [
        .yAxis(.clockwise), .yAxis(.half), .yAxis(.counterclockwise),
        .xAxis(.clockwise), .xAxis(.half), .xAxis(.counterclockwise),
        .zAxis(.clockwise), .zAxis(.half), .zAxis(.counterclockwise),
    ]
}
