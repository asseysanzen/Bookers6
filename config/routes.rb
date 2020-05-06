Rails.application.routes.draw do
  devise_for :users, controllers: {   registrations: 'users/registrations', sessions: 'users/sessions' }
  resources :users,only: [:show,:index,:edit,:update,:create]

  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resources :book_comments, only: [:create, :destroy, :show]
  end

  root 'home#top'
  get 'home/about' => 'home#about'
end
