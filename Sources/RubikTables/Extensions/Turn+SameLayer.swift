import Rubik

extension Turn {
    func sameLayer(as turn: Turn) -> Bool {
        switch (self, turn) {
        case (.up, .up),
             (.down, .down),
             (.right, .right),
             (.left, .left),
             (.front, .front),
             (.back, .back):
            return true
        default:
            return false
        }
    }
}
