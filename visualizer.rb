require 'curses'

class Visualizer

    @@count = 1
    def self.ascii(grid)
        puts "#{grid.rows}x#{grid.cols}:#{@@count} ==========================="
        (0...grid.cols).each do |col|
            (0...grid.rows).each do |row|
              print (grid.cell_at(row,col).alive? ? "*" : ".")
            end
         print "\n"
        end
        puts
        @@count +=1
    end

    def self.init_curses(grid)
        Curses.init_screen
        window = Curses::Window.new grid.rows, grid.cols, 0, 0
        window.nodelay = true
        window
    end

    def self.curses(window, grid)
        (0...grid.cols).each do |col|
            (0...grid.rows).each do |row|
              window.setpos row, col
              if grid.cell_at(row,col).alive?
                  window.addstr "*"
              else
                  window.addstr "."
              end
            end
        end
        window.refresh
        @@count +=1

    end

    def self.alive_neighbors_count(grid)
        (0...grid.cols).each do |col|
            (0...grid.rows).each do |row|
              print grid.cell_at(row,col).alive_neighbors_count
            end
         print "\n"
        end
        puts
    end
end
