#いいね機能のコントローラ
class FavoritesController < ApplicationController

    def create
        post_image = PostImage.find(params[:post_image_id])
        favorite = current_user.favorites.new(post_image_id: post_image.id)
        favorite.save
        redirect_to post_image_path(post_image) #いいねを保存後、一覧表示へリダイレクト
    end
  
    def destroy
        post_image = PostImage.find(params[:post_image_id])
        favorite = current_user.favorites.find_by(post_image_id: post_image.id)
        favorite.destroy
        redirect_to post_image_path(post_image)
    end

end
