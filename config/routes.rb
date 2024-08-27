Rails.application.routes.draw do
  resources :olympic_medals, only: [:index]

end
