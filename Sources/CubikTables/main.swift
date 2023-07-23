import Foundation
@_spi(Tables) import Cubik

// Start the timer. Tested on a 2018 Macbook Air,
// the script completes in roughly 30 seconds.
var startTime = Date().timeIntervalSince1970

// Do not buffer stdout. This forces stdout to always
// be flush, so the messages output correctly.
setbuf(stdout, nil)

print("Generating Fridrich cross table...", terminator: "")
let fridrichCrossTable = generateCubeStateTable(
    size: 190080,
    allowedTurns: [
        .up(.clockwise), .up(.half), .up(.counterclockwise),
        .down(.clockwise), .down(.half), .down(.counterclockwise),
        .right(.clockwise), .right(.half), .right(.counterclockwise),
        .left(.clockwise), .left(.half), .left(.counterclockwise),
        .front(.clockwise), .front(.half), .front(.counterclockwise),
        .back(.clockwise), .back(.half), .back(.counterclockwise)
    ],
    encode: encodeCross(_:)
)
print("✅")
print("Writing Fridrich cross table...", terminator: "")
try! write(table: fridrichCrossTable, to: "fridrich_cross")
print("✅")

print("Generating Thistlethwaite table one...", terminator: "")
let thistlethwaiteTableOne = generateCubeStateTable(
    size: 2048,
    allowedTurns: [
        .up(.clockwise), .up(.half), .up(.counterclockwise),
        .down(.clockwise), .down(.half), .down(.counterclockwise),
        .right(.clockwise), .right(.half), .right(.counterclockwise),
        .left(.clockwise), .left(.half), .left(.counterclockwise),
        .front(.clockwise), .front(.half), .front(.counterclockwise),
        .back(.clockwise), .back(.half), .back(.counterclockwise)
    ],
    encode: encodeThistlethwaiteOne(_:)
)
print("✅")
print("Writing Thistlethwaite table one...", terminator: "")
try! write(table: thistlethwaiteTableOne, to: "thistlethwaite_one")
print("✅")

print("Generating Thistlethwaite table two...", terminator: "")
let thistlethwaiteTableTwo = generateCubeStateTable(
    size: 1082565,
    allowedTurns: [
        .up(.clockwise), .up(.half), .up(.counterclockwise),
        .down(.clockwise), .down(.half), .down(.counterclockwise),
        .right(.clockwise), .right(.half), .right(.counterclockwise),
        .left(.clockwise), .left(.half), .left(.counterclockwise),
        .front(.half),
        .back(.half)
    ],
    encode: encodeThistlethwaiteTwo(_:)
)
print("✅")
print("Writing Thistlethwaite table two...", terminator: "")
try! write(table: thistlethwaiteTableTwo, to: "thistlethwaite_two")
print("✅")

print("Generating Thistlethwaite table three...", terminator: "")
let thistlethwaiteTableThree = generateCubeStateTable(
    size: 29400,
    allowedTurns: [
        .up(.clockwise), .up(.half), .up(.counterclockwise),
        .down(.clockwise), .down(.half), .down(.counterclockwise),
        .right(.half),
        .left(.half),
        .front(.half),
        .back(.half)
    ],
    encode: encodeThistlethwaiteThree(_:)
)
print("✅")
print("Writing Thistlethwaite table three...", terminator: "")
try! write(table: thistlethwaiteTableThree, to: "thistlethwaite_three")
print("✅")

print("Generating Thistlethwaite table four...", terminator: "")
let thistlethwaiteTableFour = generateCubeStateTable(
    size: 663552,
    allowedTurns: [
        .up(.half),
        .down(.half),
        .right(.half),
        .left(.half),
        .front(.half),
        .back(.half)
    ],
    encode: encodeThistlethwaiteFour(_:)
)
print("✅")
print("Writing Thistlethwaite table four...", terminator: "")
try! write(table: thistlethwaiteTableFour, to: "thistlethwaite_four")
print("✅")

var endTime = Date().timeIntervalSince1970

print("Complete! Finished in \(endTime - startTime) seconds.")
