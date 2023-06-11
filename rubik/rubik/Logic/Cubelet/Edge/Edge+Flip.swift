extension Edge {
    mutating func flip() {
        /*
         * Flip the orientation of the edge.
         */
        
        // We can use 1 - rawValue because 1 - 0 = 1 and 1 - 1 = 0.
        self.orientation = EdgeOrientation(rawValue: 1 - self.orientation.rawValue)!
    }
}
