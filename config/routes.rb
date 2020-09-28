Rails.application.routes.draw do
  root 'post_images#index' #ログイン認証が成功後、投稿画像一覧画面が表示されるように設定
  devise_for :users #deviseを使用する際にURLとしてusersを含む
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
