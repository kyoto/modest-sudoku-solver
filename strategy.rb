module Sudoku
  module Strategy
    # Represents a strategy for solving a sudoku puzzle
    class Strategy
      # Reduce (simplify) the sudoku problem based on the knowledge that cell (x, y) was just set to val
      def reduce!(grid, x, y, val)
        raise "This method should be overridden"
      end

      # Decide which cell should next have it's value guessed by the solver
      # Should "return x, y" to return the row and column indices of the cell
      def next_cell(grid)
        raise "This method should be overridden"
      end

      # Return a cell's index "group" (0, 1, 2), (3, 4, 5) or (6, 7, 8)
      def group(i)
        case i
        when 0..2 then (0..2).to_a
        when 3..5 then (3..5).to_a
        when 6..8 then (6..8).to_a
        end
      end
    end


    # Very basic strategy for solving sudoku
    # Just scans through the unsolved cells from top-left to bottom-right and sets the first one if finds to the lowest
    # raining possible value for that cell
    class FirstCellStrategy < Strategy
      def reduce_one!(grid, x, y, val)
        (0..8).each do |i|
          grid[i][y].delete(val) unless i == x
          grid[x][i].delete(val) unless i == y
        end
        group(x).each do |i|
          group(y).each do |j|
            grid[i][j].delete(val) unless i == x && j == y
          end
        end
      end

      def reduce_all!(grid)
        start_grid = grid.clone
        (0..8).each do |x|
          (0..8).each do |y|
            reduce_one!(grid, x, y, grid[x][y].first) if grid[x][y].length == 1
          end
        end

        # Reduce again if any change was made
        reduce_all!(grid) unless start_grid == grid
      end

      # Just removes possible values from other cells in the same row, col and group
      def reduce!(grid, x, y, val)
        reduce_one!(grid, x, y, val)
        reduce_all!(grid)
      end

      # Returns the first unsolved cell we find (no attempt to use heuristics)
      def next_cell(grid)
        grid.each_with_index do |row, x|
          row.each_with_index do |cell, y|
            return x, y if cell.length > 1
          end
        end
      end
    end


    # Very simple heuristic based solver
    # Always solves the "most constrained" cell (the cell with the fewest remaining possible values)
    class MostConstrainedCellStrategy < FirstCellStrategy
      def next_cell(grid)
        min_possibilities, min_x, min_y = nil, nil, nil
        grid.each_with_index do |row, x|
          row.each_with_index do |cell, y|
            if cell.length > 1 && (min_possibilities.nil? || cell.length < min_possibilities)
              min_possibilities = cell.length
              min_x = x
              min_y = y
            end
          end
        end
        return min_x, min_y
      end
    end
  end
end
