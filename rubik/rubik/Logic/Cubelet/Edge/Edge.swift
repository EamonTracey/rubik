struct Edge: Cubelet, Equatable {
    /*
     * On a Rubik's cube, there are 12 edge cubelets: white-red, white-orange,
     * white-green, white-blue, yellow-red, yellow-orange, yellow-green, yellow-blue,
     * red-green, orange-green, red-blue, and orange-blue.
     */
    
    let solvedPosition: EdgePosition
    var orientation: EdgeOrientation
}
