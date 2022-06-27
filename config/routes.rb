Rails.application.routes.draw do

root to:'public/homes#top'

  scope module: :public do
    get 'current_users/index' => "users#index"
    get 'current_users/show' => "users#show"
    get 'current_users/edit' => "users#edit"
    patch 'current_users/edit' => "users#update"

  end

  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

 get '/admin' => 'admin/homes#top'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
