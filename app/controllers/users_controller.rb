#マイページのコントローラ
class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        @post_images = @user.post_images.page(params[:page]).reverse_order #@post_imagesをshow.hrml.rbに渡す
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user.id)
    end
    
    private #更新するデータのストロングパラメータ
    
    def user_params
        params.require(:user).permit(:name, :profile_image)
    end

end
