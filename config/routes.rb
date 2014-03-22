UrlShortener::Application.routes.draw do
  resources :links

  get '/:token', to: 'links#show'

  root to: 'links#index'
end
