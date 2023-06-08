extension Corner {
    mutating func twist(_ degree: CornerOrientation) {
        /*
         * Twist the corner by the specified degree.
         * Note that is degree = clockwise, this does not set the orientation
         * to clockwise, rather it twists the corner clockwise from its previous
         * state.
         */
        
        self.orientation = CornerOrientation(rawValue: ((self.orientation.rawValue + degree.rawValue) % 3))!
    }
}
