class MusicsController < ApplicationController
  def index
    offset = params[:offset].nil? ? 0 : params[:offset]
    limit = params[:limit].nil? ? 100 : params[:limit]
    if params[:artist_id].nil? then
      @musics = Music.all.limit(limit).offset(offset).order(:title)
    else
      return render status: 400 unless Artist.exists?(params[:artist_id])
      @musics = Music.where(artist_id: params[:artist_id]).limit(limit).offset(offset).order(:title)
    end
  end

  def show
    return render text: "", status: 404 unless Music.exists?(params[:id])
    @music = Music.find(params[:id])
  end
end
