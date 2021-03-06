# Modest Sudoku Solver

A minimalist Sudoku solver implemented in Ruby with an emphasis on clean code over efficiency.

Demo: http://andypickering.com/sudoku/

## Usage

    require_relative "game"

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

## License

### The MIT License (MIT)
Copyright (c) 2012 Andrew Pickering, andypickering.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

