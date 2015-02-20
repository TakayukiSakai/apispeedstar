class Music < ActiveRecord::Base
    self.table_name = 'music'

    belongs_to :artist
    has_many :play_histories
    has_many :playlist_details
end
