require_relative "strategy"

module Sudoku
  # Represents a game of sudoku
  class Game
    attr_reader :grid

    def initialize(grid, strategy = nil)
      raise "grid must be a 9x9 matrix" if grid.length != 9 || grid.detect {|row| row.length != 9}
      @grid = grid.map {|row|
        row.map {|cell|
          raise "Invalid value '#{cell}' (expected integer from 1 to 9 or nil)" unless (1..9) === cell || cell.nil?
          cell.nil? ? (1..9).to_a : [cell]
        }
      }
      @strategy = strategy || Strategy::MostConstrainedCellStrategy.new
      @strategy.reduce_all!(@grid)
    end

    def [](x, y)
      @grid[x][y]
    end

    def []=(x, y, val)
      @grid[x][y] = [val]
      @strategy.reduce!(@grid, x, y, val)
    end

    def clone
      Marshal.load(Marshal.dump(self))
    end

    def to_s
      @grid.map {|row|
        row.map {|cell| cell.length > 1 ? "."
                                        : cell.empty? ? "x" : cell.first}.join
      }.join("\n")
    end

    def solved?
      # Solved if every cell has one single possible value remaining
      !@grid.detect {|row| row.detect {|cell| cell.length != 1}}
    end

    def invalid?
      # Invalid if any cell is empty (no remaining possible values)
      !!@grid.detect {|row| row.detect {|cell| cell.empty?}}
    end

    # Returns a solution to the puzzle if one exists or returns nil if no solution exists
    def solution
      answer = self.clone.solve
      answer.nil? ? nil : answer.grid.map {|row| row.map {|cell| cell.first}}
    end

    # Returns a copy of this Game with all cells assigned values that represent a solution to the puzzle
    # If there are multiple solutions, the first one found is returned
    # If no solution exists, nil is returned
    def solve
      if invalid?
        nil
      elsif solved?
        self
      else
        x, y = @strategy.next_cell(@grid)

        # Try each of the possible values for cell [x, y] and if one leads to a solution, return that solution
        self[x, y].each {|val|
          next_game = self.clone
          next_game[x, y] = val
          next_solution = next_game.solve
          return next_solution unless next_solution.nil?
        }

        # No solution found
        nil
      end
    end
  end
end
