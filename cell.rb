class Cell

    attr_accessor :state, :next_state, :row, :col, :grid

    def initialize(grid, state, row, col)
        @grid, @state, @row, @col = grid, state, row, col
        @next_state = nil
    end

    def alive?
        state
    end

    def dead?
        !state
    end

    def to_s
        "#<Cell #{object_id}: row:#{row}  col:#{col}  state:#{state} >"
    end

    def calculate_next!
        self.next_state = alive? ? [2,3].include?(alive_neighbors_count) : (alive_neighbors_count == 3)
    end

    def update_state!
      self.state = self.next_state
      self.next_state = nil
    end

    #private
    # count the total number of live neighbors
    def alive_neighbors_count
        @neighbors ||= @grid.get_neighbors(row, col)
        @neighbors.select{|c| c.alive?}.size
    end

end



