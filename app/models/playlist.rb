class Playlist < ActiveRecord::Base
    self.table_name = 'playlist'
    self.primary_key = :name

    has_many :playlist_details, foreign_key: :playlist_name
end
