extension Array where Element == String {
    func write(to path: String) throws {
        let string = self.joined(separator: "\n") + "\n"
        try string.write(toFile: path, atomically: true, encoding: .ascii)
    }
}
