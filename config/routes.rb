Rails.application.routes.draw do
  devise_for :users #deviseを使用する際にURLとしてusersを含む
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
