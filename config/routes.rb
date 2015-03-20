Rails.application.routes.draw do
  devise_for :owners, controllers: { registrations: 'owners/registrations' }
  devise_for :members, controllers: { registrations: 'members/registrations' }

  resources :clubs do
    member do
      get :join
      get :leave
    end

    resources :workouts do
      member do
        get :join
        get :leave
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
