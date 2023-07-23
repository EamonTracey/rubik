import ArgumentParser
import CoreFoundation
import Cubik

struct Solve: ParsableCommand {
    static var configuration = CommandConfiguration(abstract: "Solve a 3x3 cube.", discussion: discussion)

    @Argument(help: ArgumentHelp(cubesHelp), transform: stringToCube(_:))
    var cubes: [Cube] = []

    @Option(name: .shortAndLong, help: "The method used to generate a solution.")
    var method = Solver.Method.thistlethwaite

    @Flag(name: .shortAndLong, help: "Display verbose messages.")
    var verbose = false

    func run() throws {
        let solver = Solver()

        var startTime = CFAbsoluteTimeGetCurrent()
        solver.loadTables(for: method)
        var endTime = CFAbsoluteTimeGetCurrent()
        printv("Method: \(method)")
        printv("Time to load tables: \(endTime - startTime)")

        for cube in CubeIterator(cubes: cubes) {
            startTime = CFAbsoluteTimeGetCurrent()
            let result = solver.solve(cube, using: method)
            endTime = CFAbsoluteTimeGetCurrent()

            switch result {
            case .success(let solution):
                printv("Number of turns: \(solution.turns.count)")
                printv("Time to find solution: \(endTime - startTime)")
                print(solution)
            case .failure(let error):
                switch error {
                case .invalidCube:
                    throw ValidationError("The provided facelets represent an invalid cube.")
                case .unsolvableEdgeOrientation:
                    throw ValidationError("The cube's edge orientation is unsolvable.")
                case .unsolvableCornerOrientation:
                    throw ValidationError("The cube's corner orientation is unsolvable")
                case .unsolvablePermutation:
                    throw ValidationError("The cube's permutation is unsolvable.")
                case .corruptedTables:
                    throw ValidationError("The installation of cubik is broken. Please reinstall.")
                }
            }
        }
    }
}

extension Solve {
    func printv(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        if verbose {
            print(items, separator: separator, terminator: terminator)
        }
    }
}

extension Solver.Method: ExpressibleByArgument {
    public init?(argument: String) {
        switch argument {
        case "fridrich":
            self = .fridrich
        case "pochmann":
            self = .pochmann
        case "thistlethwaite":
            self = .thistlethwaite
        default:
            return nil
        }
    }
}

fileprivate let discussion = "There are two accepted ways to represent a scrambled cube as a string: " +
  "character-facelet representation or an algorithm.\n\nThe character-facelet representation is a string of length " +
  "54 with 6 unique characters, each corresponding to a facelet type (sticker color) on the cube. The facelets are " +
  "numbered sequentially left-to-right and top-to-bottom in the following order of faces: up, down, right, left, " +
  "front, back.\n\nYou may also represent a scrambled cube by the algorithm used to scramble it starting from the " +
  "solved state. Algorithm notation accepts U, D, R, L, F, and B to represent clockwise turns of the up, down, " +
  "right, left, front, and back layers, respectively. Appending an apostrophe (\"'\") to a turn indicates a " +
  "counterclockwise turn. Appending a \"2\" to a turn indicates a half (180 degree) turn. Each turn must be " +
  "separated by a space.\n\nFor example, the following two strings equivalently represent the " +
  "superflip.\nCharacter-facelet: wbwowrwgwygyoyrybyrwrgrbryrowobogoyogwgogrgygbwbrbobyb\nAlgorithm: U R2 F B R B2 R " +
  "U2 L B2 R U' D' R2 F R' L B2 U2 F2"

fileprivate let cubesHelp = "The scrambled cubes in character-facelet representation OR the algorithm that scrambled " +
"the cube. If no scrambles are provided, they are read from stdin."
