FakerNews::Application.routes.draw do
  root to: 'articles#index'

  resources :users, :except => [:destroy]
  resources :articles do
    resources :comments, :only => [:new, :show, :create]
  end
  resources :comments, :only => [:new, :index, :show, :create]
  resource :session, :only => [:new, :create, :destroy]
end
