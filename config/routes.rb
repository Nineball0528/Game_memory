Rails.application.routes.draw do


root to:'public/homes#top'

  scope module: :public do
    resources :users, only:[:index, :show, :edit]
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
