Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
root to:'public/homes#top'



  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

scope module: :public do

    get '/about' => "homes#about", as: 'about'
    get 'users/confirm' => "users#confirm"
    patch 'users/withdraw' => 'users#withdraw'
    resources :users, only: [:index, :show, :edit, :update] do
        resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    end

    resources :post, only:[:index, :show, :edit, :new, :create ,:destroy, :update] do
     get :search, on: :collection
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
