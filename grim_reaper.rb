require_relative 'grid'
require_relative 'visualizer'
require 'debugger'
class GrimReaper

    SEED_FILE = ARGV[0] || "seed_file.txt"

    def self.start_game!
      @@grid = Grid.new(SEED_FILE)
      @@window = Visualizer.init_curses(@@grid)
      while(true)
        Visualizer.curses(@@window, @@grid)
        #Visualizer.ascii(@@grid)
        #Visualizer.alive_neighbors_count(@@grid)
        @@grid.next_turn!
        sleep(0.25)
      end
    end

end

GrimReaper.start_game!
