import ArgumentParser

struct Representation: ParsableCommand {
    static var configuration: CommandConfiguration = CommandConfiguration(
        commandName: "rep",
        abstract: "Display the cube representation scheme."
    )

    func run() throws {
        print(representationScheme)
    }
}

let representationScheme = """
U = Up
D = Down
R = Right
L = Left
F = Front
B = Back

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
