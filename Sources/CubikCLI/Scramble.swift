import ArgumentParser
import Cubik

struct Scramble: ParsableCommand {
    static var configuration = CommandConfiguration(abstract: "Generate random 3x3 scrambles.")

    @Option(name: .shortAndLong, help: "The number of scrambles to be generated.")
    var number: Int = 1

    @Flag(name: .shortAndLong, help: "Output the scramble as a string of facelets instead of an algorithm.")
    var faceletRepresentation: Bool = false

    func run() throws {
        for _ in 0..<number {
            let randomAlgorithm = Algorithm.random()

            if faceletRepresentation {
                var cube = Cube.solvedCube
                cube.execute(randomAlgorithm)
                print(cube.stringRepresentation)
            } else {
                print(randomAlgorithm)
            }
        }
    }
}
