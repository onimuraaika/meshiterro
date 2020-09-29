#マイページのコントローラ
class UsersController < ApplicationController
    
    def show
        @user = User.find(params[:id])
        @post_images = @user.post_images.page(params[:page]).reverse_order #@post_imagesをshow.hrml.rbに渡す
    end
end
