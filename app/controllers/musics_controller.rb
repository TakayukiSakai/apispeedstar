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

  def new
    return render text: '', status: 400 unless Artist.exists?(params[:artist_id])
    if Music.create(music_params) then
      render text: '', status: 201
    else
      render text: '', status: 400
    end
  end

  def edit
    return render text: '', status: 404 unless Music.exists?(params[:id])
    return render text: '', status: 400 unless Artist.exists?(params[:artist_id])
    if Music.find(params[:id]).update(music_params) then
      render text: '', status: 204
    else
      render text: '', status: 400
    end
  end

  def destroy
    return render text: '', status: 404 unless Music.exists?(params[:id])
    Music.find(params[:id]).destroy
    render text: '', status: 200
  end

  def times
    offset = params[:offset].nil? ? 0 : params[:start]
    limit = params[:limit].nil? ? 100 : params[:limit]
    if params[:id] == nil then
      @musics = Music.all.limit(limit).offset(offset).order(:title)
    else
      return render text: '', status: 400 unless Music.exists?(params[:id])
      @musics = [Music.find(params[:id])]
    end
  end

  private
    def music_params
      params.permit(:artist_id, :title, :outline)
    end
end
