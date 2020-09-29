#投稿画像の詳細画面（/post_image/:id/）にコメント投稿機能を実装するためのコントローラ
class PostCommentsController < ApplicationController
  
    def create #コメント投稿を保存
        post_image = PostImage.find(params[:post_image_id])
        comment = current_user.post_comments.new(post_comment_params) #comment = PostComment.new(post_comment_params)とcomment.user_id = current_user.idの2行を省略
        comment.post_image_id = post_image.id
        comment.save
        redirect_to post_image_path(post_image)
    end

    def destroy #コメント投稿を削除
    end
    
    private #コメント投稿データのストロングパラメータ設定
    
    def post_comment_params
        params.require(:post_comment).permit(:comment)
    end
end
