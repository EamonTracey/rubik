protocol Cubelet {
    /*
     * Cubelet refers to a specific piece on the cube, of which there are 26.
     * There are 12 edges, 8 corners, and 6 centers.
     */
    
    /*
     * Each cubelet has an orientation. The type of orientation is different
     * between differing cubelets, though it always requires a defined frame
     * of reference.
     */
    associatedtype Orientation
    
    /*
     * Each cubelet has a position. The type of position is different between
     * differing cubelets (an edge cubelet cannot be in a corner position). Note
     * that "position" refers to a fixed part of the cube and is not synonymous
     * with "cubelet" which refers to a specific piece that can move to different
     * positions.
     *
     * The notation to designate positions has the hierarchy:
     *   - U > D > R > L > F > B
     *   - up > down > right > left > front > back
     */
    associatedtype Position
    
    /*
     * The solved position is a constant that designates a specific piece.
     * The cubelet has no information on its actual position. On a Rubik's cube,
     * the solved position corresponds to the color of the stickers on the cubelet.
     */
    var solvedPosition: Position { get }
    
    /*
     * A cubelet knows its orientation.
     */
    var orientation: Orientation { get set }
}

struct Edge: Cubelet, Equatable {
    /*
     * On a Rubik's cube, there are 12 edge cubelets: white-red, white-orange,
     * white-green, white-blue, yellow-red, yellow-orange, yellow-green, yellow-blue,
     * red-green, orange-green, red-blue, and orange-blue.
     */
    
    let solvedPosition: EdgePosition
    var orientation: EdgeOrientation
}

struct Corner: Cubelet, Equatable {
    /*
     * On a Rubik's cube, there are 8 corner cubelets: white-red-green, white-red-blue,
     * white-orange-green, white-orange-blue, yellow-red-green, yellow-red-blue,
     * yellow-orange-green, and yellow-orange-blue.
     */
    
    let solvedPosition: CornerPosition
    var orientation: CornerOrientation
}
