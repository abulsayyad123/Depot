Rails.application.routes.draw do
  get 'admin', to: 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  scope '(:locale)' do
    resources :users
    resources :orders
    resources :line_items
    resources :carts
    resources :products do
      get :who_bought, on: :member
    end
    root to: 'store#index', as: 'store'
  end

  # resources :articles do
  #   resources :comments, only: [:index, :new, :create]
  # end
  # resources :comments, only: [:show, :edit, :update, :destroy]


  #--------------Sample Practice URLs  ---------
  # resources :articles do
  #   resources :comments, shallow: true
  # end

  # resources :photos do
  #   member do
  #     get 'preview'
  #   end
  # end

  # resources :photos do
  #   collection do
  #     get 'search'
  #   end
  # end

  # resources :comments do
  #   get 'preview', on: :new
  # end

  # get 'exit', to: 'sessions#destroy', as: :logout

  #-------------End of practice URLs -------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
