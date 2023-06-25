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
  get "search" => "searches#search"
  resources :reviews, only:[:index, :create, :show, :edit, :update, :destroy]
  resources :customers, only:[:index, :show, :edit, :update]

end

scope module: :public do
  root to: 'homes#top'
  get '/about' => 'homes#about', as: 'about'
  get "search" => "searches#search"
  get "search_tag" => "reviews#search_tag"
  # 退会確認画面
  get  '/customers/check' => 'customers#check'
  # 論理削除用のルーティング
  patch  '/customers/withdraw' => 'customers#withdraw'
  devise_scope :customer do
    post '/guest_sign_in', to: 'sessions#guest_sign_in'
  end
  resources :reviews do
    resource :favorites, only: [:create, :destroy]
    resources :review_comments, only: [:create, :destroy]

  end
  resources :customers, only:[:show, :edit, :update]
end



end
