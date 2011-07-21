# Modest Sudoku Solver

A minimalist sudoku solver in Ruby with an emphasis on clean code over efficiency.

## Usage

    grid = [[  4,   9, nil, nil, nil, nil, nil, nil,   7],
            [nil, nil, nil,   1, nil, nil, nil, nil, nil],
            [nil, nil,   5,   4,   3, nil, nil, nil, nil],
            [  1, nil, nil, nil,   6, nil, nil,   4,   2],
            [  5, nil, nil,   2, nil, nil, nil, nil, nil],
            [nil, nil, nil,   7, nil, nil, nil, nil, nil],
            [  6,   2, nil, nil, nil,   5,   7, nil,   4],
            [nil, nil,   1, nil, nil, nil, nil,   2,   9],
            [nil,   4,   9, nil,   2, nil,   6, nil, nil]]

    solution = Sudoku::Game.new(grid).solution

    solution.to_s
      # => [[4, 9, 6, 8, 5, 2, 3, 1, 7],
      #     [2, 7, 3, 1, 9, 6, 4, 8, 5],
      #     [8, 1, 5, 4, 3, 7, 2, 9, 6],
      #     [1, 8, 7, 5, 6, 3, 9, 4, 2],
      #     [5, 6, 4, 2, 8, 9, 1, 7, 3],
      #     [9, 3, 2, 7, 4, 1, 5, 6, 8],
      #     [6, 2, 8, 9, 1, 5, 7, 3, 4],
      #     [3, 5, 1, 6, 7, 4, 8, 2, 9],
      #     [7, 4, 9, 3, 2, 8, 6, 5, 1]]

