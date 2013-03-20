#!/usr/bin/env ruby

require "pp"
require_relative "game"

_ = nil
grid = [[4, 9, _, _, _, _, _, _, 7],
        [_, _, _, 1, _, _, _, _, _],
        [_, _, 5, 4, 3, _, _, _, _],
        [1, _, _, _, 6, _, _, 4, 2],
        [5, _, _, 2, _, _, _, _, _],
        [_, _, _, 7, _, _, _, _, _],
        [6, 2, _, _, _, 5, 7, _, 4],
        [_, _, 1, _, _, _, _, 2, 9],
        [_, 4, 9, _, 2, _, 6, _, _]]

solution = Sudoku::Game.new(grid).solution

expected = [[4, 9, 6, 8, 5, 2, 3, 1, 7],
            [2, 7, 3, 1, 9, 6, 4, 8, 5],
            [8, 1, 5, 4, 3, 7, 2, 9, 6],
            [1, 8, 7, 5, 6, 3, 9, 4, 2],
            [5, 6, 4, 2, 8, 9, 1, 7, 3],
            [9, 3, 2, 7, 4, 1, 5, 6, 8],
            [6, 2, 8, 9, 1, 5, 7, 3, 4],
            [3, 5, 1, 6, 7, 4, 8, 2, 9],
            [7, 4, 9, 3, 2, 8, 6, 5, 1]]

if solution == expected
  puts "PASSED"
else
  puts """FAILED

Expected:
#{expected.pretty_inspect}
Got:
#{solution.pretty_inspect}
"""
end

