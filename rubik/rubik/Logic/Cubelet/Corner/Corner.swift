struct Corner: Cubelet, Equatable {
    /*
     * On a Rubik's cube, there are 8 corner cubelets: white-red-green, white-red-blue,
     * white-orange-green, white-orange-blue, yellow-red-green, yellow-red-blue,
     * yellow-orange-green, and yellow-orange-blue.
     */
    
    let solvedPosition: CornerPosition
    var orientation: CornerOrientation
}
