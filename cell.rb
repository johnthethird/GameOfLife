class Cell
    
    attr_accessor :state, :row, :col, :grid
    
    # state = :alive or :dead
    def initialize(grid, state, row, col)
        @grid, @state, @row, @col = grid, state, row, col
    end
    
    def next!
        self.state == if alive?
            [2,3].include?(count_neighbors) ? :alive : :dead
        else
            count_neighbors == 3 ? :alive : :dead
        end
    end

    def alive?
        state == :alive
    end

    def dead?
        state == :dead
    end
    
    private
    # count the total number of live neighbors
    def count_neighbors
        souls = 0
        (-1..1).each do |offset_row|
            (-1..1).each do |offset_col|
              souls =+ 1 if grid.cell_at(row + offset_row, col + offset_col).alive?
            end
        end
    end
       
end

