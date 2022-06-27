Rails.application.routes.draw do

root to:'public/homes#top'



  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

scope module: :public do

    get 'users/confirm' => "users#confirm"
    patch 'users/withdraw' => 'users#withdraw'
    resources :users, only: [:index, :show, :edit, :update]
    resources :post, only:[:index, :show, :edit, :new, :create ,:destroy, :update] do
    resources :post_comments, only: [:create]
    resource :favorites, only: [:create, :destroy]
  end
  end

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

 get '/admin' => 'admin/homes#top'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
