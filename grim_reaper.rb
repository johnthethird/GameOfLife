require 'grid'
require 'cell'

class GrimReaper
    
    SEED_FILE = ARGV[0]
    
    def self.start_game!
      @@grid = Grid.new(SEED_FILE)
      while(true)
        next_turn()
      end
    end
    
    private

    def self.next_turn
      @@grid.next_turn!
    end
    
end