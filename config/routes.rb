Rails.application.routes.draw do
  resources :paintings do
    resources :strokes do
      resources :points
    end
  end

  post "/paintings/:id" => "paintings#update"
end
