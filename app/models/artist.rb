class Artist < ActiveRecord::Base
    self.table_name = 'artist'
    has_many :musics
end
