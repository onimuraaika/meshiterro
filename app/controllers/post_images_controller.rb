#画像投稿用のコントローラ
class PostImagesController < ApplicationController

    def new
        @post_image = PostImage.new #画像投稿用空のインスタンス
    end

    def create #保存
        @post_image = PostImage.new(post_image_params)
        @post_image.user_id = current_user.id
        if  @post_image.save
            redirect_to post_images_path #バリデーションチェック後保存できたら投稿一覧画面へ
        else
            render :new #同じコントローラ内のnewアクションのviewを表示
        end
    end

    def index
        #@post_images = PostImage.all　は、全てを取得し表示してしまう
        @post_images = PostImage.page(params[:page]).reverse_order #「reverse_order」は降順。ページングで決められた文だけ表示するよう設定
    end

    def show
        @post_image = PostImage.find(params[:id])
        @post_comment = PostComment.new #「詳細画面にコメント」インスタンス変数
    end
    
    def destroy
        @post_image = PostImage.find #resourcesルーティングのdestroyで渡された（params[:id]）を元に、findメソッドで削除データを探し、@post_imageインスタンスに格納。
        @post_image.destroy
        redirect_to post_images_path #削除されたら一覧表示画面へリダイレクト
    end

    private #投稿データのストロングパラメータ設定

    def post_image_params
        params.require(:post_image).permit(:shop_name, :image, :caption)
    end
end
