Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    resources :musics, only: [:index, :show]
  end
end
