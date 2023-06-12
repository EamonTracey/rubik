extension Thistlethwaite {
    enum StepTwo {
        /*
         * Step two orients the 8 corners and places the middle layer edges into
         * their slice, implying a factor:
         *   - 3^7 * 12C4 = 3^7 * 12!/8!/4! = 1082565
         */
        static let factor = 1082565
        
        /*
         * Since the edges are oriented in step one, quarter turns of the F and
         * B layers are unnecessary for the proceeding steps. Step two allows
         * the remaining 14 turns.
         */
        static let allowedTurns: [Turn] = [
            .up(.clockwise), .up(.half), .up(.counterclockwise),
            .down(.clockwise), .down(.half), .down(.counterclockwise),
            .right(.clockwise), .right(.half), .right(.counterclockwise),
            .left(.clockwise), .left(.half), .left(.counterclockwise),
            .front(.half),
            .back(.half)
        ]
    }
}
