import ArgumentParser
import Cubik

struct Net: ParsableCommand {
    static var configuration: CommandConfiguration = CommandConfiguration(
        abstract: "Display a 3x3 unfolded as a net.",
        discussion: discussion
    )

    @Argument(help: ArgumentHelp(cubesHelp), transform: stringToCube(_:))
    var cubes: [Cube] = []

    @Flag(name: .shortAndLong, help: "Use colored unicode characters instead of letters.")
    var color: Bool = false

    func run() throws {
        let characterMap: [Cube.Facelet: String] = [
            .up:    color ? "⬜️" : "u" ,
            .down:  color ? "🟨": "d",
            .right: color ? "🟥" : "r",
            .left:  color ? "🟧" : "l",
            .front: color ? "🟩" : "f",
            .back:  color ? "🟦" : "b",
        ]
        for cube in CubeIterator(cubes: cubes) {
            let facelets = cube.facelets
            let space = color ? "       " : "    "

            print(space + facelets[0...2].map { characterMap[$0]! }.joined())
            print(space + facelets[3...5].map { characterMap[$0]! }.joined())
            print(space + facelets[6...8].map { characterMap[$0]! }.joined())
            print(facelets[27...29].map { characterMap[$0]! }.joined(), terminator: " ")
            print(facelets[36...38].map { characterMap[$0]! }.joined(), terminator: " ")
            print(facelets[18...20].map { characterMap[$0]! }.joined(), terminator: " ")
            print(facelets[45...47].map { characterMap[$0]! }.joined())
            print(facelets[30...32].map { characterMap[$0]! }.joined(), terminator: " ")
            print(facelets[39...41].map { characterMap[$0]! }.joined(), terminator: " ")
            print(facelets[21...23].map { characterMap[$0]! }.joined(), terminator: " ")
            print(facelets[48...50].map { characterMap[$0]! }.joined())
            print(facelets[33...35].map { characterMap[$0]! }.joined(), terminator: " ")
            print(facelets[42...44].map { characterMap[$0]! }.joined(), terminator: " ")
            print(facelets[24...26].map { characterMap[$0]! }.joined(), terminator: " ")
            print(facelets[51...53].map { characterMap[$0]! }.joined())
            print(space + facelets[9...11].map { characterMap[$0]! }.joined())
            print(space + facelets[12...14].map { characterMap[$0]! }.joined())
            print(space + facelets[15...17].map { characterMap[$0]! }.joined())
        }
    }
}

fileprivate let discussion = """
The net of a cube consists of its facelets unfolded onto the 2D plane. Below is the scheme used.

u = up, d = down, r = right, l = left, f = front, b = back

           ------------
     U     | 0  1  2  |
    LFRB   | 3  4  5  |
     D     | 6  7  8  |
---------------------------------------------
| 27 28 29 | 36 37 38 | 18 19 20 | 45 46 47 |
| 30 31 32 | 39 40 41 | 21 22 23 | 48 49 50 |
| 33 34 35 | 42 43 44 | 24 25 26 | 51 52 53 |
---------------------------------------------
           | 9  10 11 |
           | 12 13 14 |
           | 15 16 17 |
           ------------
"""

fileprivate let cubesHelp = "The scrambled cubes in character-facelet representation OR the algorithm that scrambled " +
"the cube. If no scrambles are provided, they are read from stdin."
