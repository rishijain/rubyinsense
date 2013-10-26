Rubyinsense::Application.routes.draw do
  match '/home' => 'home#index'
  match '/about-us' => 'home#about_us'
  match '/auth/:provider/callback' => 'home#create'
  devise_for :users, :controllers => {:registrations => 'registrations'}

  resources :questions do
    collection do
      get 'my_questions'
      get 'vote'
    end
    post 'rating', on: :member
    resources :answers
    resources :comments, only: [:create, :destroy]
  end
  root :to => 'questions#index'
end
