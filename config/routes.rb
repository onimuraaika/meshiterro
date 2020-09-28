Rails.application.routes.draw do
    root 'post_images#index' #ログイン認証が成功後、投稿画像一覧画面が表示されるように設定
    devise_for :users #deviseを使用する際にURLとしてusersを含む
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :post_images, only: [:new, :create, :index, :show] #(画像投稿に)必要なルウーティングのみ生成
end
