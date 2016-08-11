Rails.application.routes.draw do
  resources :strokes do
    resources :points
  end

  resources :paintings do
  end

  post "/paintings/:id" => "paintings#update"
end
