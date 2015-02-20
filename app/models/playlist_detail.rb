class PlaylistDetail < ActiveRecord::Base
    self.table_name = 'playlist_detail'

    belongs_to :music
    belongs_to :playlist, foreign_key: :playlist_name
end
