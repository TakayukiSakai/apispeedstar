class PlayHistory < ActiveRecord::Base
    self.table_name = 'play_history'

    belongs_to :music
end
