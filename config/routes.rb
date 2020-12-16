Rails.application.routes.draw do
  # get '/trainings' => 'trainings#index'
  namespace :api do
    namespace :v1 do
      resources :meetings, only: [:index, :create, :destroy]
    end
  end
end
