require_relative 'cell'
require 'matrix'

class Grid

  attr_accessor :grid, :rows, :cols

   def initialize(seed_file_path)
     seed_data = load_seed(seed_file_path)
     @grid = grid_from_seed(seed_data)
   end

   def cell_at(row,col)
       @grid.element(row, col) if row >= 0 && col >= 0
   end

   def get_neighbors(row,col)
        cells = []
        (-1..1).each do |offset_row|
            (-1..1).each do |offset_col|
              cells << cell_at(row+offset_row,col+offset_col) unless offset_row == 0 && offset_col == 0
            end
        end
        cells.compact
    end


   def load_seed(seed_file_path)
       seed_data = []
       @cols = 0
       line_idx = 0
       File.open(seed_file_path, 'r').each_line do |line|
         my_line = []
         num_line_chars = 0
         char_idx = 0
         line.strip.each_char do |char|
             puts "#{char}: #{alive?(char)}"
           my_line << Cell.new(self, alive?(char), line_idx, char_idx)
           num_line_chars += 1
           @cols = num_line_chars if num_line_chars > @cols
           char_idx += 1
         end
         @rows = line_idx + 1
         line_idx += 1
         seed_data << my_line
       end
       self.pad_seed_data(seed_data)
   end

   def pad_seed_data(seed_data)
       seed_data.each_with_index do |row, line_idx|
         if row.size < @cols
            row_size_diff = @cols - row.size
            char_idx = row.size
            row_size_diff.times do
                puts "padding #{line_idx} #{char_idx}"
              row <<  Cell.new(self, false, line_idx, char_idx)
              char_idx += 1
            end
         end
       end
       seed_data
   end

   def alive?(char)
      char != '.'
   end

   def grid_from_seed(seed_data)
      Matrix.rows(seed_data)
   end

   def next_turn!
     calculate_next!
     update_state!
   end

   private

   def calculate_next!
     (0...rows).each do |row|
         (0...cols).each do |col|
             cell_at(row,col).calculate_next!
         end
     end
   end

   def update_state!
     (0...rows).each do |row|
         (0...cols).each do |col|
             cell_at(row,col).update_state!
         end
     end
   end

end
