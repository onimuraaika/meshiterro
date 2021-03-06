Rails.application.routes.draw do
    #「get 'users/show'」を削除。マイページのルーティングとの重複を避けるため。
    root 'post_images#index' #ログイン認証が成功後、投稿画像一覧画面が表示されるように設定
    devise_for :users #deviseを使用する際にURLとしてusersを含む
    resources :post_images, only: [:new, :create, :index, :show]
    resources :post_images, only: [:new, :create, :index, :show, :destroy] do #(画像投稿に)必要なルウーティングのみ生成
      resource :favorites, only: [:create, :destroy] #投稿画像に対してのいいね機能、保存と削除だけ
      resources :post_comments, only: [:create, :destroy] #投稿画像に対してのコメントだから、post_commentsは、post_imagesと親子関係。
    end
    resources :users, only: [:show, :edit, :update] #マイページ、マイページ表示、プロフィール編集、更新だけ
end
