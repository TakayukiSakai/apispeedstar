json.array! @musics do |music|
  json.id music.id
  json.last_played music.recent
end