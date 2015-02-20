Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    resources :musics do
      collection do
        post '' => 'musics#new'
        put ':id' => 'musics#edit'
        get 'times' => 'musics#times'
        post ':id/play' => 'musics#play'
      end
    end
  end
end
