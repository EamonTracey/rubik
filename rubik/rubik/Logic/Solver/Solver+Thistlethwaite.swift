extension Solver {
    func thistlethwaite(_ cube: Cube) -> Algorithm? {
        /*
         * Thistlethwaite's method to solve the cube involves four steps. Each
         * step restricts the set of turns necessary to solve the cube, beginning
         * with all 18 turns and finishing at 0 turns (the cube is solved). The first,
         * second, third, and fourth steps reduce the space of cube states by factors
         * of 2048, 1082565, 29400, and 663552, respectively. Note the following:
         *   - 2048 * 1082565 * 29400 * 663552 = 43252003274489856000.
         * The resulting product is the exact nubmer of possible states of the cube.
         *
         * At each step, we use a lookup table to determine how to proceed with the solve.
         * To generate the lookup tables, we will use graph traversals. The states of a
         * cube may be represented by nodes in a graph. Edges in the graph correspond to
         * turns. Adjacent nodes are one turn away. For each step, we will begin at the
         * solved cube node. Then, we traverse the graph until we discover all paths
         * (algorithms) to cube states that are relevant to that particular step.
         *
         * The first, second, third, and fourth steps guarantee completion using at most
         * 7, 10, 13, and 15 turns, respectively. This implies that Thistlethwaite's method
         * guarantees a solution of at most 45 turns.
         */
        
        return nil
    }
}
