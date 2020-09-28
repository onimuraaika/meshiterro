class PostImagesController < ApplicationController #画像投稿用のコントローラ

    def new
        @post_image = PostImage.new #画像投稿用空のインスタンス
    end

    def create #保存
        @post_image = PostImage.new(post_image_params)
        @post_image.user_id = current_user.id
        @post_image.save
        redirect_to #投稿一覧
    end

    def index
    end

    def show
    end

    private #投稿データのストロングパラメータ設定

    def post_image_params
        params.require(:post_image).permit(:shop_name, :image, :caption)
    end
end
