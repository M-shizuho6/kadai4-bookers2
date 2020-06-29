Rails.application.routes.draw do
	devise_for :users
    delete 'books/:id', to: 'books#destroy'

    root 'homes#top'
    get 'home/about', to: 'homes#about'

    resources :books
    resources :users, only: [:index, :show, :edit, :update]
end
