Rails.application.routes.draw do
  devise_for :owners
  devise_for :members

  resources :clubs do
    member do
      get :join
      get :leave

      resources :workouts do
        member do
          get :join
          get :leave
        end
      end
    end

    resources :members do
      member do
        get :kick
      end
    end
  end

  resources :owners, only: [ :edit, :update ]

  root 'clubs#index'
end
