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
end

namespace :public do
  root to: 'homes#top'
  get '/about' => 'homes#about'
end

end
