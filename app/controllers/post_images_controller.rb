#画像投稿用のコントローラ
class PostImagesController < ApplicationController

    def new
        @post_image = PostImage.new #画像投稿用空のインスタンス
    end

    def create #保存
        @post_image = PostImage.new(post_image_params)
        @post_image.user_id = current_user.id
        @post_image.save
        redirect_to #投稿一覧画面へ
    end

    def index
        #@post_images = PostImage.all　は、全てを取得し表示してしまう
        @post_images = PostImage.page(params[:page]).reverse_order #ページングで決められた文だけ表示するよう設定
    end

    def show
        @post_image = PostImage.find(params[:id])
        @post_comment = PostComment.new #「詳細画面にコメント」インスタンス変数
    end

    private #投稿データのストロングパラメータ設定

    def post_image_params
        params.require(:post_image).permit(:shop_name, :image, :caption)
    end
end
