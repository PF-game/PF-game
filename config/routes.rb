Rails.application.routes.draw do

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}



namespace :admin do
  root to: 'homes#top'
  get "search_tag" => "reviews#search_tag"
  resources :reviews, only:[:index, :create, :show, :edit, :update, :destroy]
  resources :customers, only:[:index, :show, :edit, :update]

end

scope module: :public do
  root to: 'homes#top'
  get '/about' => 'homes#about', as: 'about'
  get "search_tag" => "reviews#search_tag"
  # post '/guest_sign_in', to: 'sessions#guest_sign_in'
  devise_scope :customer do
    post '/guest_sign_in', to: 'sessions#guest_sign_in'
  end
  resources :reviews
  resources :customers, only:[:show, :edit, :update]
end



end
