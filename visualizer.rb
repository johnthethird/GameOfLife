class Visualizer
    
    def self.ascii(grid)
        puts "Its Alive! (ASCII)"
        (0..grid.cols).each do |col|
            put col
            (0..grid.rows).each do |row|
              puts (grid.cell_at(row,col).alive? ? "*" : ".")
            end
            put "\n"
        end
    end
end
