class Music < ActiveRecord::Base
    self.table_name = 'music'

    belongs_to :artist
    has_many :play_histories
    has_many :playlist_details

    validates :artist_id, presence: true
    validates :title, presence: true

    def count
        PlayHistory.where(music_id: self.id).count()
    end
end
