extension Edge {
    mutating func flip() {
        /*
         * Flip the orientation of the edge.
         */
        
        // 1 - 0 = 1
        // 1 - 1 = 0
        self.orientation = EdgeOrientation(rawValue: 1 - self.orientation.rawValue)!
    }
}
