Rails.application.routes.draw do
  resources :paintings do
    resources :strokes do
      resources :points
    end
  end

  get "/map_data" => 'paintings#map_data'

  post "/paintings/:id" => "paintings#update"
end
