Rails.application.routes.draw do
  resources :paintings do
    resources :strokes do
      resources :points
    end
  end

  get "/paintings_summary" => 'paintings#summary'

  post "/paintings/:id" => "paintings#update"
end
