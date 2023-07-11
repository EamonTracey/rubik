@_spi(Tables)
@inlinable
public func encodeThistlethwaiteOne(_ cube: Cube) -> Int {
    let edgeOrientation = cube.edges[0].orientation.rawValue +
                          cube.edges[1].orientation.rawValue * 2 +
                          cube.edges[2].orientation.rawValue * 4 +
                          cube.edges[3].orientation.rawValue * 8 +
                          cube.edges[4].orientation.rawValue * 16 +
                          cube.edges[5].orientation.rawValue * 32 +
                          cube.edges[6].orientation.rawValue * 64 +
                          cube.edges[7].orientation.rawValue * 128 +
                          cube.edges[8].orientation.rawValue * 256 +
                          cube.edges[9].orientation.rawValue * 512 +
                          cube.edges[10].orientation.rawValue * 1024

    return edgeOrientation
}
