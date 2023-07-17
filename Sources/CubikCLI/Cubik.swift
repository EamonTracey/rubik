import ArgumentParser

@main
struct Cubik: ParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "Cube utilities via the command line.",
        subcommands: [Solve.self, Scramble.self, Net.self]
    )
}
